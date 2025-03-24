variable "region" {
    description = "AWS Region that you need to deploy the resources..." 
    type = string
    default = "us-west-2"
}

variable "bucket_name" {

    description = "Name of the bucket that needs to be created....."
    type = string
  
}

variable "environment" {
    description = "Name of the environment"
    type = string
  
}

variable "bucket_acl" {
    default = "private"
    description = "Access controlled list setting for bucket......"
  
}