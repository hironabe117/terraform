# providers.tf
terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
  #profile = "dev"
}

# provider "aws" {
#   alias   = "virginia"
#   region  = "us-east-1"
#   profile = "dev"
# }