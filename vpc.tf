provider "aws" {
    region     = "us-east-1"
  
}

resource "aws_vpc" "shan_vpc" {
  cidr_block = "10.16.0.0/16"
  tags = {
    Name = "shan_vpc"
  }
}

resource "aws_subnet" "web_subnet" {
  vpc_id            = aws_vpc.shan_vpc.id
  cidr_block        = "10.16.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "web_subnet"
  }
}

resource "aws_subnet" "db_subnet" {
  vpc_id            = aws_vpc.shan_vpc.id
  cidr_block        = "10.16.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "db_subnet"
  }
}
