terraform {
  backend "s3" {
    bucket         = "yp-terraform-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "yp2-state-lock"
  }
}



