terraform {
  backend "s3" {
    bucket         = "yp-terraform-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "yash-dynamodb-table"
  }
}