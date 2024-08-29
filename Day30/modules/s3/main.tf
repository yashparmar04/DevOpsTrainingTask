provider "aws" {
  region = var.region
}

# S3 Bucket
resource "aws_s3_bucket" "app_data" {
  bucket = "${terraform.workspace}-yp-bucket"

  tags = {
    Name = "${terraform.workspace}-yp-bucket" 
  }

  provisioner "local-exec" {
    command = "echo 'S3 bucket Created'"
  }
}
