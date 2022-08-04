#public Route table

resource "aws_route_table" "public-routeTable" {
  vpc_id = "${aws_vpc.myvpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "public-routeTable"
  }
}


#Associate this Route Table to the public subnets


resource "aws_route_table_association" "associate1" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public-routeTable.id}"
}


resource "aws_route_table_association" "associate2" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.public-routeTable.id}"
}



#private route table


resource "aws_route_table" "private-routeTable" {
  vpc_id = "${aws_vpc.myvpc.id}"


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat-gateway.id}"
  }

  tags = {
    Name = "private-routeTable"
  }
}

#Associate this Route Table to the private subnets

 resource "aws_route_table_association" "associate-p1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-routeTable.id
}

resource "aws_route_table_association" "associate-p2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-routeTable.id
}
