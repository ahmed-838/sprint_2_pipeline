output "instance_1_public_ip" {
  description = "The public IP address of EC2 Instance 1"
  value       = aws_instance.instance_1.public_ip
}

output "instance_2_public_ip" {
  description = "The public IP address of EC2 Instance 2"
  value       = aws_instance.instance_2.public_ip
}

output "instance_3_public_ip" {
  description = "The public IP address of EC2 Instance 3"
  value       = aws_instance.instance_3.public_ip
}
