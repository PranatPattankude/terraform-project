resource "aws_key_pair" "deployer" {
  key_name   = "terra-automate-key"
  public_key = file("./terra_key.pub")
}

resource "aws_instance" "AppServer" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = aws_subnet.pub_sub.id
  vpc_security_group_ids      = [aws_security_group.security.id]
  associate_public_ip_address = true

  user_data = base64encode(<<-EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  EOF
)


  tags = {
    Name = "App Server"
  }

}
