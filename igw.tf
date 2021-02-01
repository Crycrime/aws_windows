resource "aws_internet_gateway" "test_vpc_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "Test VPC Internet Gateway"
  }
}
