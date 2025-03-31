output "rds_endpoint" {
    description = "RDS endpoint"
    value = aws_db_instance.rds.endpoint
  
}

output "rds_identifier" {
    description = "RDS identifier"
    value = aws_db_instance.rds.id
  
}

output "rds_arn" {
    description = "RDS arn"
    value = aws_db_instance.rds.arn
  
}