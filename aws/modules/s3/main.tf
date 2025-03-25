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
