resource "aws_vpc" "harsh-viradia-vpc-1" {
  cidr_block = var.cidr1
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
}

resource "aws_subnet" "harsh-viradia-1-subnet1" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
}

resource "aws_subnet" "harsh-viradia-1-subnet2" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
}

resource "aws_subnet" "harsh-viradia-1-subnet3" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
}

resource "aws_subnet" "harsh-viradia-1-subnet4" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-1.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
}

resource "aws_internet_gateway" "harsh-viradia-igw-1" {
  vpc_id = aws_vpc.harsh-viradia-vpc-1.id
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
}

resource "aws_route_table" "harsh-viradia-public-table" {
  vpc_id = aws_vpc.harsh-viradia-vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harsh-viradia-igw-1.id
  }
  tags = {
    Name  = "harsh viradia public route table"
    Owner = var.Owner
  }
}

resource "aws_route_table" "harsh-viradia-private-table" {
  vpc_id = aws_vpc.harsh-viradia-vpc-1.id
  tags = {
    Name  = "harsh viradia private route table"
    Owner = var.Owner
  }
}

resource "aws_route_table_association" "harsh-viradia-public-subnet1" {
  subnet_id      = aws_subnet.harsh-viradia-1-subnet1.id
  route_table_id = aws_route_table.harsh-viradia-public-table.id
}

resource "aws_route_table_association" "harsh-viradia-public-subnet2" {
  subnet_id      = aws_subnet.harsh-viradia-1-subnet2.id
  route_table_id = aws_route_table.harsh-viradia-public-table.id
}

resource "aws_route_table_association" "harsh-viradia-private-subnet1" {
  subnet_id      = aws_subnet.harsh-viradia-1-subnet3.id
  route_table_id = aws_route_table.harsh-viradia-private-table.id
}

resource "aws_route_table_association" "harsh-viradia-private-subnet2" {
  subnet_id      = aws_subnet.harsh-viradia-1-subnet4.id
  route_table_id = aws_route_table.harsh-viradia-private-table.id
}
