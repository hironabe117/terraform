resource "aws_s3_bucket" "bucket1" {
  bucket = var.s3_bucket1_name
  
  tags = {
    Name        = var.s3_bucket1_name
    Owner = var.owner_name
  }
}

resource "aws_s3_bucket_versioning" "versioning_bucket1" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}