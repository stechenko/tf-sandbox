terraform {
  backend "remote" {
    hostname = "5b57df081b4e.test-env.scalr.com"
    organization = "org-sgpvfvrkj5ao2j0"
    workspaces {
      name = "testopa"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "server_id" {
  byte_length = 4
}

#resource "aws_instance" "oleg-tf" {
#  ami = var.image_id
#  instance_type = var.instance_type
#  subnet_id = var.subnet_id

#  tags = {
#    Name = "oleg-${random_id.server_id.hex}"
#    owner = "oleg"
#  }
#}
