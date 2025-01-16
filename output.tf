output "instance_ip" {
  description = "Public Ip of Instance"
  value = aws_instance.AppServer.public_ip
}

output "instance_ip_url" {
  description = "Public Url of Instance"
  value = "https://${aws_instance.AppServer.public_ip}"
}

output "SSH_login" {
  description = "Login using ssh"
  value       = "ssh -i <private key> ec2-user@${aws_instance.AppServer.public_ip}"
}