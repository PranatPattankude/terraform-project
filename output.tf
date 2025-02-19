output "instance_ip" {
  description = "Public Ip of Instance"
  value = aws_instance.AppServer.public_ip
}

output "instance_ip_url" {
  description = "Public Url of Instance"
  value = "http://${aws_instance.AppServer.public_ip}:80"
}

output "SSH_connect" {
  description = "Command to connect server"
  value = "ssh -i terra_key ubuntu@${aws_instance.AppServer.public_ip}"  
}