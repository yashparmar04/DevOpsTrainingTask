terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.16"
    }
  }
  required_version = ">=1.2.0"
}
provider "aws" {
  region = var.region_name
}
resource "aws_vpc" "yp_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "yp_vpc"
  }
}
resource "aws_subnet" "yp_subnet" {
  vpc_id            = aws_vpc.yp_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "yp_subnet"
  }
}
resource "aws_subnet" "yp_subnet_opt" {
  vpc_id            = aws_vpc.yp_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "yp_subnet_opt"
  }
}
resource "aws_internet_gateway" "yp_internet_gateway" {
  vpc_id = aws_vpc.yp_vpc.id
  tags = {
    Name = "yp_internet_gateway"
  }
}
resource "aws_route_table" "yp_route_table" {
  vpc_id = aws_vpc.yp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.yp_internet_gateway.id
  }

  tags = {
    Name = "yp_route_table"
  }
}
resource "aws_route_table_association" "yp_route_table_association" {
  subnet_id      = aws_subnet.yp_subnet.id
  route_table_id = aws_route_table.yp_route_table.id
}
resource "aws_security_group" "yp_security_group" {
  name        = "yp_security_group"
  description = "Allow HTTP and SSH access"
  vpc_id      = aws_vpc.yp_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "yp_security_group"
  }
}
resource "aws_instance" "yp_instance" {
  ami             = var.ami_id
  instance_type   = var.ec2_type
  subnet_id       = aws_subnet.yp_subnet.id
  security_groups = [aws_security_group.yp_security_group.id]

  tags = {
    Name = "yp_instance"
  }
}
resource "aws_db_subnet_group" "yp_db_subnet_group" {
  name       = "yp_db_subnet_group"
  subnet_ids = [aws_subnet.yp_subnet.id,aws_subnet.yp_subnet_opt.id]

  tags = {
    Name = "yp_db_subnet_group"
  }
}
resource "aws_db_instance" "yp_mysql_db" {
  identifier             = "yp-mysql-db"
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                   = var.db_name
  username               = var.db_user
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.yp_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.yp_security_group.id]
  publicly_accessible    = true
  tags = {
    Name = "yp_mysql_db"
  }
}
 
 resource "aws_s3_bucket" "static_assets" {
  bucket = "my-static-assets-${random_id.bucket_id.hex}"
}
resource "random_id" "bucket_id" {
  byte_length = 4
}
