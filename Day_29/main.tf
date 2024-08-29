terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-000a81e3bab21747d"
  instance_type     = "t2.micro"
  region            = "us-east-2"
  name              = "yp-ec2"
}


module "s3" {
  source      = "./modules/s3"
  region      = "us-east-2"
  environment = "develop"
  bucket_name = "s3-bucket-yp"
}