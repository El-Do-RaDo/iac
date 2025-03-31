terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}


resource "aws_db_subnet_group" "rds" {
  name       = "${var.environment}_${var.rds_name}_subnet_group"
  subnet_ids = var.rds_subnet_ids
  tags = {
    Name = "${var.environment}_${var.rds_name}_subnet_group"
  }
}

resource "aws_db_instance" "rds" {
  identifier              = "${var.environment}_${var.rds_name}"
  allocated_storage       = var.rds_allocated_storage
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_type
  username                = var.rds_username
  password                = var.rds_password
  db_subnet_group_name    = aws_db_subnet_group.rds.name
  vpc_security_group_ids  = var.rds_security_group_ids
  availability_zone       = var.rds_availability_zone
  multi_az                = var.rds_multi_az
  backup_retention_period = var.rds_backup_retention_period
  skip_final_snapshot     = var.rds_skip_final_snapshot
  storage_encrypted       = var.rds_storage_encrypted
  publicly_accessible     = var.rds_publicly_accessible

  tags = {
    Name = "${var.environment}_${var.rds_name}"
    Environment = var.environment
  }
}
