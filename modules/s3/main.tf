provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3publicblock44" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "s3publicblock44" {
  bucket = aws_s3_bucket.s3publicblock44.id

  index_document {
    suffix = "index.html"
  }
}


resource "aws_s3_account_public_access_block" "s3publicblock44" {
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "s3publicblock44" {
  bucket = aws_s3_bucket.s3publicblock44.id
  
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}