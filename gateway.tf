resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "terraform-gateway"
  }
}



resource "aws_eip" "ip" {
  vpc      = true
  tags = {
    Name = "nat-elasticIP"
  }
}


resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = "${aws_eip.ip.id}"
  subnet_id     = "${aws_subnet.public1.id}"
  tags = {
    Name = "nat-gateway"
  }
}