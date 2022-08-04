resource "aws_vpc" "myvpc" {
  cidr_block       =  var.vpc_CIDR
  enable_dns_hostnames = "true"

  tags = {
    Name = "terraform-vpc"
  }
}

