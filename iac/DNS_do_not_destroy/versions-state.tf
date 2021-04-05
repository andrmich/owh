provider "aws" {
  region = var.region
}

terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }


  backend "s3" {
    bucket         = "aisim-tf-state"  # <---- CHANGE HERE
    key            = "DNS"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-locking"
  }
}