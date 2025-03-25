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
