variable "aws_region" {
  default = "ap-southeast-2"
  type    = string
}


variable "aws_profile" {
  default = "workshop"
  type    = string
}


terraform {
  backend "s3" {
    bucket  = "nkbt--workshop--tfstate"
    key     = "wtf.tfstate"
    region  = "ap-southeast-2"
    profile = "tf"
  }
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


module "www" {
  source = "./www"
}

output "www_url" {
  value = module.www.www_url
}
