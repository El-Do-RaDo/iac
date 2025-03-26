variable "region" {
    description = "AWS Region that you need to deploy the resources..." 
    type = string
    default = "us-west-2"
}

variable "instance_type" {

    description = "Type/Size of thr resource you need to have...."
    default = "t3a.micro"
  
}

variable "ec2_name" {
    description = "Name of the ec2 server created....."
    type = string
  
}

variable "environment" {
    description = "Environment that needs to be deployed"
    type = string
  
}

variable "cost_centre" {
    description = "Cost centre for cost management like to which project this resources belongs"
    type = string
  
}

variable "ec2_ami_id" {
    description = "AMI ID for the ec2 instance that you want to create...."
    
  
}

variable "os_name" {
    description = "Name of the os that you want to use if you don't have any AMI id...."
    default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  
}

variable "ec2_vpc_id" {
    description = "VPC ID in which you need to create the EC2"
    type = string
  
}

variable "ec2_subnet_id" {
    description = "Subnet ID in which you need to deploy the EC2"
    type = string
  
}

variable "iam_instance_profile" {
    description = "IAM Role Profile for the EC2 instance"
    type = string
    default = ""
  
}

variable "ebs_volume_size" {

    description = "The size of the volume that needs to be created...."
    default = 20
  
}