# This is provider block
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "my-s3-bucket-backend-demo"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.vpc_region
  profile = "default"
}

