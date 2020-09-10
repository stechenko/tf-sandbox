terraform {
  backend "remote" {
    hostname = "bcf5006bcd45.test-env.scalr.com"
    organization = "env-svrcnchebt61e30"
    workspaces {
      name = "test"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "server_id" {
  byte_length = 4
}

resource "aws_instance" "oleg-tf" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id

  tags = {
    Name = "oleg-${random_id.server_id.hex}"
    owner = "oleg"
  }
}
