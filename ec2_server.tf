resource "aws_key_pair" "deployer" {
  key_name   = "terra-automate-key"
  public_key = file("C:/Users/prana/.ssh/id_ed25519.pub")
}

resource "aws_instance" "AppServer" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = aws_subnet.pub-sub.id
  vpc_security_group_ids      = [aws_security_group.security.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    sudo systemctl enable apache2
    EOF


  tags = {
    Name = "App Server"
  }
}
