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

resource "tls_private_key" "ec2_key_pair" {
  algorithm = "RSA"
  rsa_bits = 4096
  
}

resource "aws_key_pair" "ec2_generated_key" {
  key_name = var.ec2_name
  public_key = tls_private_key.ec2_key_pair.public_key_openssh
  
}

resource "local_file" "private_key_pem" {
  filename = "${path.module}/${var.ec2_name}.pem"
  content = tls_private_key.ec2_key_pair.private_key_pem
  file_permission = "0600"
  
}

resource "aws_security_group" "ec2_sg" {
  name = "${var.ec2_name}_sg"
  description = "Allow the inbound rules..."
  vpc_id = var.ec2_vpc_id

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}
resource "aws_instance" "ec2_instance" {
  instance_type = var.instance_type
  ami = var.ec2_ami_id != "" ? var.ec2_ami_id : var.os_name.id
  subnet_id = var.ec2_subnet_id
  key_name = aws_key_pair.ec2_generated_key.key_name
  vpc_security_group_ids = [ aws_security_group.ec2_sg.id ]

  tags = {
    Name = "${var.environment}_${var.ec2_name}"
    Environment = var.environment
    Cost_Centre = var.cost_centre
  }
  
}

resource "aws_ebs_volume" "ec2_ebs_volume" {
  availability_zone = aws_instance.ec2_instance.availability_zone
  type = "gp3"
  size = var.ebs_volume_size

  tags = {
    Name = "${var.ec2_name}_ebs"
    Environment = var.environment
    Cost_Centre = var.cost_centre
  }
  
}

resource "aws_volume_attachment" "ec2_ebs_association" {
  device_name = "/dev/xvda"
  volume_id = aws_ebs_volume.ec2_ebs_volume.id
  instance_id = aws_instance.ec2_instance.id
  
}