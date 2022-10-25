output "instance_id" {
  description = "ID of the EC2 Instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 Instance"
  value       = aws_instance.app_server.public_ip
}
