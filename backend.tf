terraform {
  backend "s3" {
    bucket = "terraform-statefile-ezzat"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table  = "terraform-test"
  }
}
