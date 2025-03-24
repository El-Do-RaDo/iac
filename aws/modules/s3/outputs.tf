output "bucket_arn" {
    description = "ARN of the bucket created....."
    value = aws_s3_bucket.s3_bucket.arn
  
}

output "bucket_id" {
    description = "ID of bucket created....."
    value = aws_s3_bucket.s3_bucket.id
  
}