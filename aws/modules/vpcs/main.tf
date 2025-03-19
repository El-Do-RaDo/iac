terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}

resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.name
    Environment =  var.environment
  }
  
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.module_vpc.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}_public_subnet_${count.index}"
    Environment = var.environment
  }
  
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.module_vpc.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.name}_private_subnet_${count.index}"
    Environment = var.environment
  }
  
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.module_vpc.id

  tags = {
    Name = "${var.name}_vpc_igw"
    Environment = var.environment
  }
  
}

resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.module_vpc.id

  route =   {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "${var.name}_public_route_table"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public_subnet_rt_association" {
  count = length(aws_subnet.public_subnet.*.id)
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_subnet_route_table.id
  
}

resource "aws_eip" "vpc_eip_natgateway" {
  depends_on = [ aws_internet_gateway.vpc_igw ]
  domain = "vpc"
  tags = {
    Name = "${var.name}_natgateway_ip"
    Environment = var.environment
  }
  
}

resource "aws_nat_gateway" "vpc_nat_gateway" {
  subnet_id = aws_subnet.public_subnet.id
  allocation_id = aws_eip.vpc_eip_natgateway.id

  tags = {
    Name = "${var.name}_vpc_natgateway"
    Environment = var.environment
  }
  
}

resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.module_vpc.id
  route = {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.vpc_nat_gateway.id
  }
  
  tags = {
    Name = "${var.name}_private_route_table"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "private_subnet_rt_association" {
  count = length(aws_subnet.private_subnet.*.id)
  subnet_id = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_subnet_route_table.id
  
}