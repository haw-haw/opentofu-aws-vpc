resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr-block-private-subnets[0]
    availability_zone = data.aws_availability_zones.available.names[0]

tags = {
    Name = var.private-subnet-names[0]
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr-block-private-subnets[1]
  availability_zone = data.aws_availability_zones.available.names[1]
tags = {
    Name = var.private-subnet-names[1]
  }
}

resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr-block-private-subnets[2]
    availability_zone = data.aws_availability_zones.available.names[2]

tags = {
    Name = var.private-subnet-names[2]
  }
}


resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet1.id
tags = {
    "Name" = var.ngw-name
  }
}

resource "aws_route_table" "nat" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
 tags = {
    "Name" = var.private-route-table-name
  } 


}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.nat.id
}
resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.nat.id
}