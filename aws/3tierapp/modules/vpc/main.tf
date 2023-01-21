resource "aws_vpc" "main" {
  cidr_block       = var.vpC_cidr_range
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}
