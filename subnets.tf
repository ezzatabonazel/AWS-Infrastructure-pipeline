resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone_id = "use1-az1"
  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone_id = "use1-az2"
  tags = {
    Name = "private2"
  }
}


resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone_id = "use1-az1"
  map_public_ip_on_launch = true
  tags = {
    Name = "public1"
  }
}


resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone_id = "use1-az2"
  map_public_ip_on_launch = true
  tags = {
    Name = "public2"
  }
}