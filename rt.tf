resource "aws_route_table" "test_vpc_public" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_vpc_igw.id
  }

  tags = {
    Name = "Public subnets rt for Test VPC"
  }
}

resource "aws_route_table_association" "test_vpc_2a_public" {
  subnet_id      = aws_subnet.pub_subnet_2a.id
  route_table_id = aws_route_table.test_vpc_public.id
}
