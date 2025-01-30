resource "aws_vpc" "AppVPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "App VPC"
  }
}

# Public SUbnet
resource "aws_subnet" "pub_sub" {
  cidr_block        = var.pub_sub.cidr_block
  vpc_id            = aws_vpc.AppVPC.id
  availability_zone = var.pub_sub.availability_zone
  tags = {
    Name = "Public net"
  }
}

#internet Getway
resource "aws_internet_gateway" "App-igw" {
  vpc_id = aws_vpc.AppVPC.id
  tags = {
    Name= "App Gateway"
  }
}

#Route Table Public
resource "aws_route_table" "AppRoute" {
  vpc_id = aws_vpc.AppVPC.id

  route {
    cidr_block = var.RT_cidr
    gateway_id = aws_internet_gateway.App-igw.id
  }
  tags = {
    Name = "RT Public"
  }
}

#Route table association
resource "aws_route_table_association" "pub-associate" {
  route_table_id = aws_route_table.AppRoute.id
  subnet_id = aws_subnet.pub_sub.id

}