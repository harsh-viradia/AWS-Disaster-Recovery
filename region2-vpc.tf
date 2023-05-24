resource "aws_vpc" "harsh-viradia-vpc-2" {
  cidr_block = var.cidr2
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_subnet" "harsh-viradia-2-subnet1" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-2.id
  cidr_block        = "11.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_subnet" "harsh-viradia-2-subnet2" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-2.id
  cidr_block        = "11.0.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_subnet" "harsh-viradia-2-subnet3" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-2.id
  cidr_block        = "11.0.3.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_subnet" "harsh-viradia-2-subnet4" {
  vpc_id            = aws_vpc.harsh-viradia-vpc-2.id
  cidr_block        = "11.0.4.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_internet_gateway" "harsh-viradia-igw-2" {
  vpc_id = aws_vpc.harsh-viradia-vpc-2.id
  tags = {
    Name  = var.Name
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_route_table" "harsh-viradia-public-table-1" {
  vpc_id = aws_vpc.harsh-viradia-vpc-2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harsh-viradia-igw-2.id
  }
  tags = {
    Name  = "harsh viradia public route table"
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_route_table" "harsh-viradia-private-table-1" {
  vpc_id = aws_vpc.harsh-viradia-vpc-2.id
  tags = {
    Name  = "harsh viradia private route table"
    Owner = var.Owner
  }
  provider = aws.region2
}

resource "aws_route_table_association" "harsh-viradia-public-1-subnet1" {
  subnet_id      = aws_subnet.harsh-viradia-2-subnet1.id
  route_table_id = aws_route_table.harsh-viradia-public-table-1.id
  provider       = aws.region2
}

resource "aws_route_table_association" "harsh-viradia-public-1-subnet2" {
  subnet_id      = aws_subnet.harsh-viradia-2-subnet3.id
  route_table_id = aws_route_table.harsh-viradia-public-table-1.id
  provider       = aws.region2
}

resource "aws_route_table_association" "harsh-viradia-private-1-subnet1" {
  subnet_id      = aws_subnet.harsh-viradia-2-subnet2.id
  route_table_id = aws_route_table.harsh-viradia-private-table-1.id
  provider       = aws.region2
}

resource "aws_route_table_association" "harsh-viradia-private-1-subnet2" {
  subnet_id      = aws_subnet.harsh-viradia-2-subnet4.id
  route_table_id = aws_route_table.harsh-viradia-private-table-1.id
  provider       = aws.region2
}
