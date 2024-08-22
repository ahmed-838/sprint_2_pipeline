# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

# Output the ID of the VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

# Output the ID of the subnet
output "subnet_id" {
  value = aws_subnet.main.id
}

# Output the ID of the security group
output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}
