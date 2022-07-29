variable "region" {
  type = string
}

variable "vpc_CIDR" {
  type = string
}

variable "private1_subnet_CIDR" {
  type = string
}

variable "private2_subnet_CIDR" {
  type = string
}
variable "public1_subnet_CIDR" {
  type = string
}

variable "public2_subnet_CIDR" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}

variable "name" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "parameter_group_name" {
  type = string
}
