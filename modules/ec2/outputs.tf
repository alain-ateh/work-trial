output "instance_id" {
  description = "ID of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.id
}

output "instance_public_ip" {
  description = "Public IP of Jenkins server"
  value       = aws_eip.jenkins_eip.public_ip
}

output "instance_private_ip" {
  description = "Private IP of Jenkins server"
  value       = aws_instance.jenkins_server.private_ip
}

output "jenkins_url" {
  description = "Jenkins server URL"
  value       = "http://${aws_eip.jenkins_eip.public_ip}:8080"
}

output "security_group_id" {
  description = "ID of Jenkins security group"
  value       = aws_security_group.jenkins_sg.id
}