output "instance_ip" {
  description = "Public Ip of Instance"
  value = aws_instance.AppServer.public_ip
}

output "instance_ip_url" {
  description = "Public Url of Instance"
  value = "http://${aws_instance.AppServer.public_ip}"
}