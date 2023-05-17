terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Contact = "deji.adeboye"
      Project = "dejiCV"
    }
  }
}
