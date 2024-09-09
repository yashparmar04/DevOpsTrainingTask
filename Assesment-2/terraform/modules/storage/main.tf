resource "aws_s3_bucket" "static_assets" {
  bucket = var.bucket_name
  acl    = "public-read"

  versioning {
    enabled = true
  }

  tags = {
    Name = var.bucket_name
  }
}
