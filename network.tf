#Defining VPC

resource "aws_vpc" "creativeHub_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "creativeHub-vpc"
  }
}

#Defining Subnets

resource "aws_subnet" "creativeHub_subnet_1" {
  vpc_id     = aws_vpc.creativeHub_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "availability_zone-1"
  }
}

resource "aws_subnet" "creativeHub_subnet_2" {
  vpc_id     = aws_vpc.creativeHub_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "availability_zone-2"
  }
}

resource "aws_subnet" "creativeHub_subnet_3" {
  vpc_id     = aws_vpc.creativeHub_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "availability_zone-3"
  }
}

#Defining Internet Gateways

resource "aws_internet_gateway" "creativeHub_igw" {
  vpc_id = aws_vpc.creativeHub_vpc.id

  tags = {
    Name = "creativeHub-igw"
  }
}

#Defining Route Table

resource "aws_route_table" "creativeHub_rt" {
  vpc_id = aws_vpc.creativeHub_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.creativeHub_igw.id
  }

  tags = {
    Name = "creativeHub_rt"
  }
}

#Defining Route Table Association

resource "aws_route_table_association" "creativeHub_TA_1" {
  subnet_id      = aws_subnet.creativeHub_subnet_1.id
  route_table_id = aws_route_table.creativeHub_rt.id
}

resource "aws_route_table_association" "creativeHub_TA_2" {
  subnet_id      = aws_subnet.creativeHub_subnet_2.id
  route_table_id = aws_route_table.creativeHub_rt.id
}

resource "aws_route_table_association" "creativeHub_TA_3" {
  subnet_id      = aws_subnet.creativeHub_subnet_3.id
  route_table_id = aws_route_table.creativeHub_rt.id
}


