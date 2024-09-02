resource "aws_s3_bucket" "main" {
  bucket = "yash-bucket-s3"

  tags = {
    Name = "yash-s3-bucket"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}
