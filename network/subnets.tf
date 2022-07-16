
#----------------- private subnet in AZ1 -----------------
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private1_subnet_CIDR
  availability_zone = "${var.region}a"
  tags = {
    Name = "private_AZ1"
  }
}

#----------------- private subnet in AZ2 -----------------

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private2_subnet_CIDR
  availability_zone = "${var.region}b"
  tags = {
    Name = "private_AZ2"
  }
}

#----------------- public subnet in AZ1 -----------------

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public1_subnet_CIDR
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_AZ1"
  }
}

#----------------- public subnet in AZ2 -----------------

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public2_subnet_CIDR
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_AZ2"
  }
}