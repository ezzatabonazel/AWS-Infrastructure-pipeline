module "network" {

source = "./network"
region= var.region
vpc_CIDR= var.vpc_CIDR
private1_subnet_CIDR= var.private1_subnet_CIDR
private2_subnet_CIDR= var.private1_subnet_CIDR
public1_subnet_CIDR = var.public1_subnet_CIDR
public2_subnet_CIDR= var.public2_subnet_CIDR
}