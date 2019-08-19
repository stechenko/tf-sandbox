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


resource "aws_instance" "instance1" {
  ami = var.ec2_image_id
  instance_type = var.ec2_instance_type
}
