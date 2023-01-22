resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_range
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "publc_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_subnet_cidr_range

  tags = {
    Name = "publc-subnet"
  }
}

resource "aws_subnet" "privt_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pvt_subnet_cidr_range

  tags = {
    Name = "privt-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "dev-vpc-igw"
  }
}

resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.vpc.id
}
