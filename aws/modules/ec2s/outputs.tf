output "instance_id" {
    value = aws_instance.ec2_instance.id
    description = "Instance ID"
  
}

output "instance_public_ip" {
    value = aws_instance.ec2_instance.public_ip
    description = "Public IP of the instance"
  
}

output "private_key_path" {

    value = local_file.private_key_pem.filename
  
}