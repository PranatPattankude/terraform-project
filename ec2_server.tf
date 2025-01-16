resource "aws_instance" "AppServer" {
  ami                         = "ami-0182f373e66f89c85"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub-sub.id
  vpc_security_group_ids      = [aws_security_group.security.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo -i
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    EOF

  tags = {
    Name = "App Server"
  }
}
