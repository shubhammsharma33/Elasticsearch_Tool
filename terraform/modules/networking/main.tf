resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}

