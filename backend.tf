terraform {
  backend "s3" {
    bucket         = "ezzatstatebucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
