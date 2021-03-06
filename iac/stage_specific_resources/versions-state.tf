provider "aws" {
  region = "eu-central-1"
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
    bucket         = "aisim-tf-state" # <---- CHANGE HERE
    key            = "stage-specific-vpc-bastion"
    region         = "eu-central-1" # Bucket region, not deployment region
    dynamodb_table = "terraform-state-locking"
  }
}