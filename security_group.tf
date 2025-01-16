resource "aws_security_group" "security" {
  vpc_id = aws_vpc.AppVPV.id

  dynamic "ingress" {
    for_each = var.ingress-port
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg-cidr[0]]
    }
  }

  dynamic "egress" {
    for_each = var.egress-port
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = [var.sg-cidr[0]]
    }
  }
  tags = {
    Name= "App Security"
  }
}