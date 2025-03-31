terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}


resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
    Environment = var.environment
  }
  
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership" {
  bucket =   aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPrefferred"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  acl = var.s3_acl
  bucket = aws_s3_bucket.s3_bucket.id
}