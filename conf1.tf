variable "ec2_access_key" {
  type = string
  default = "*******"
}


variable "ec2_secret_key" {
  type = string
}


provider "aws" {
  region = var.region
  access_key = var.ec2_access_key
  secret_key = var.ec2_secret_key
}
