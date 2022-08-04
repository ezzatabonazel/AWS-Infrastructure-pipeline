terraform {
  backend "s3" {
    bucket         = "ezzatstate"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
  }
}
