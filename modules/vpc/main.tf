# main.tf
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Owner = var.owner_name
    Name  = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Owner = var.owner_name
    Name  = var.igw_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.default_route
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Owner = var.owner_name
    Name  = var.route_table_public_name
  }
}
