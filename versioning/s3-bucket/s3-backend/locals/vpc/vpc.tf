provider "aws" {
  region = "ap-south-1"
}

# Vpc
resource "aws_vpc" "my_vpc_1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

#  Public Subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc_1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc_1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

# Igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc_1

  tags = {
    Name = "my-igw"
  }
}


