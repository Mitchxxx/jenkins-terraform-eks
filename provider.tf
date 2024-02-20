terraform {
  backend "s3" {
    bucket         = "ibtlearning-terraform"
    key            = "ibtlearning-terraform/Eks"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-1"
}