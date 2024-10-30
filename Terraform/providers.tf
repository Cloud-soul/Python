terraform {
  backend "s3" {
    bucket = "terraform-state-ec222"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}