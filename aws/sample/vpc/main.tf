#vpc creation
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_range
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}

#public subnet creation
resource "aws_subnet" "publc_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_subnet_cidr_range

  tags = {
    Name = "publc-subnet"
  }
}

#private subnet creation
resource "aws_subnet" "privt_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pvt_subnet_cidr_range

  tags = {
    Name = "privt-subnet"
  }
}

#internet gateway creation
resource "aws_internet_gateway" "igw" {
  tags = {
    Name = "dev-vpc-igw"
  }
}

#internet gateway attachment to vpc
resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.vpc.id
}

#route creation in default route table
resource "aws_default_route_table" "def_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "default-public-rt"
  }
}

#subnet association to route table
resource "aws_route_table_association" "pub-subnet-associatn" {
  subnet_id      = aws_subnet.publc_subnet.id
  route_table_id = aws_default_route_table.def_route_table.id
}

#elastic ip creation
resource "aws_eip" "eip" {
  vpc      = true
}

#NAT gateway creation
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publc_subnet.id

  tags = {
    Name = "dev-vpc-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
