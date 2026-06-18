provider "aws" {
  region = "ap-south-1"
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# EC2 Jenkins Server
resource "aws_instance" "jenkins" {
  ami           = "ami-0c1a7f89451184c8b" # Amazon Linux
  instance_type = "c7i-flex.large"

  tags = {
    Name = "Jenkins-Server"
  }
}

