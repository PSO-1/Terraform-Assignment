# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW"
  }
}

# Elastic IP for NAT (updated: vpc -> domain = "vpc")
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "NAT-EIP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT-GW"
  }
}

