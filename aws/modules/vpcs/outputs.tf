output "vpc_id" {
    description = "The ID of the VPC created....."
    value = aws_vpc.module_vpc.id
  
}

output "public_subnet_id" {
    description = "Public Subnet ID"
    value = aws_subnet.public_subnet[*].id
  
}

output "private_subnet_id" {
    description = "Private Subnet ID"
    value =   aws_subnet.private_subnet[*].id
}

output "nat_gateway_ip" {
    description = "Natgateway Public IP"
    value = aws_eip.vpc_eip_natgateway
  
}
