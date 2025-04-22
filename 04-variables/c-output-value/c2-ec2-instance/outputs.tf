output "ec2_instance_public_ip" {
  description = "value of the public IP address of the EC2 instance"
  value       = aws_instance.myEC2[0].public_ip
}

output "ec2_instance_private_ip" {
  description = "value of the private IP address of the EC2 instance"
  value       = aws_instance.myEC2[0].private_ip
}
