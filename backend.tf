terraform {
  backend "s3" {
    bucket = "qbl-terraform"
    key    = "vpc-demo/terraform.tfstate"
    region = "ap-southeast-1"
    profile = "personal"
  }
}
