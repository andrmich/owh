terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  # Before running terraform init for the first time check README.md for instructions.
  ####### COMMENT BETWEEN HERE AND LINE 19 #######
  backend "s3" {
    bucket         = "aisim-tf-state"
    key            = "terraform-boilerplate"
    region         = "eu-central-1" # Bucket region, not deployment region
    dynamodb_table = "terraform-state-locking"
  }
  ####### COMMENT BETWEEN HERE AND LINE 12 #######

}