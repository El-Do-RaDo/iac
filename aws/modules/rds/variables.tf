variable "region" {
    description = "AWS Region that you need to deploy the resources..." 
    type = string
    default = "us-west-2"
}

variable "rds_name" {
  description = "Name for the RDS instance"
  type        = string
}

variable "rds_engine" {
  description = "Database engine (e.g. mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "8.0"
}

variable "rds_instance_type" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "rds_username" {
  description = "Master DB username"
  type        = string
}

variable "rds_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "rds_subnet_ids" {
  description = "List of subnet IDs for RDS subnet group"
  type        = list(string)
}

variable "rds_availability_zone" {
  description = "AZ to deploy RDS"
  type        = string
  default     = null
}

variable "rds_multi_az" {
  description = "Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "rds_backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "rds_skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
  default     = true
}

variable "rds_storage_encrypted" {
  description = "Encrypt RDS storage"
  type        = bool
  default     = true
}

variable "rds_publicly_accessible" {
  description = "Make DB publicly accessible"
  type        = bool
  default     = false
}

variable "rds_security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
}

variable "environment" {
    description = "Enviroment in which it is being deployed"
    type = string
  
}