terraform {
  backend "s3" {
    bucket         = "ezzatstate"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
