provider "aws" {
  region = var.region
  access_key = var.scalr_aws_access_key
  secret_key = var.scalr_aws_secret_key
}

resource "random_id" "server_id" {
  byte_length = 4
}

resource "aws_instance" "oleg-tf" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id

  tags = {
    Name = "oleg${random_id.server_id.hex}"
    owner = "oleg"
  }
}
