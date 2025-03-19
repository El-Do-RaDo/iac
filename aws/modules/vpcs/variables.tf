variable "region" {
    description = "AWS Region that you need to deploy the resources..." 
    type = string
    default = "us-west-2"
}

variable "name" {
    description = "common name for the resources to be created........."
    default = "main"
  
}

variable "environment" {
    description = "The name for the environment that you are using....."
    type = string
  
}

variable "vpc_cidr" {
    description = "CIDR IP range for a VPC....."
    default = "10.0.0.0/16"
  
}

variable "public_subnet_cidr" {
    description = "Public Subnet CIDR"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
}

variable "availability_zones" {
    description = "AZs names according to the regions"
    default = ["us-west-2a", "us-west-2b", "us-west-2c"]
  
}

variable "private_subnet_cidr" {
    description = "Private Subnet CIDR"
    default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  
}