resource "aws_subnet" "public1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.public_subnet1_az
  map_public_ip_on_launch = true
  tags = { Name = var.public_subnet1_name }
}

resource "aws_subnet" "public2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.public_subnet2_az
  map_public_ip_on_launch = true
  tags = { Name = var.public_subnet2_name }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = var.route_table_public_id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = var.route_table_public_id
}

resource "aws_security_group" "http" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    description = var.http_description
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allow_http_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.egress_cidr]
  }

  tags = { Name = var.sg_name }
}


resource "aws_subnet" "private1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet1_cidr
  availability_zone       = var.private_subnet1_az
  map_public_ip_on_launch = false
  tags = { Name = var.private_subnet1_name }
}

resource "aws_subnet" "private2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet2_cidr
  availability_zone       = var.private_subnet2_az
  map_public_ip_on_launch = false
  tags = { Name = var.private_subnet2_name }
}

resource "aws_eip" "nat" {
  tags = { Name = var.natgw_eip_name }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id
  tags = { Name = var.natgw_name }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = { Name = var.route_table_private_name }
}

resource "aws_route" "private_natgw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

