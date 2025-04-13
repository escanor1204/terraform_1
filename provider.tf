terraform {
  backend "s3" {
    bucket = "337909778466-2025-terraform-tfstate"
    key = "dev/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "337909778466-2025terraform-tfstate-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
}


