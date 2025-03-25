terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}

data "aws_ami" "ec2_ami" {
  most_recent = true
  filter {
    name = "name"
    values = [ var.os_name ]
  }

  filter {
    name = "virtualization-type"
    values = [ "hvm"]
  }
  owners = [ "self" ]
  
}


resource "aws_instance" "ec2_instance" {
  instance_type = var.instance_type
  ami = var.ec2_ami_id != "" ? var.ec2_ami_id : var.os_name.id

  tags = {
    Name = "${var.environment}_${var.ec2_name}"
    Environment = var.environment
    Cost_Centre = var.cost_centre
  }
  
}