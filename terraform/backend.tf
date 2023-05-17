terraform {
  backend "s3" {
    bucket = "deji-backend"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}