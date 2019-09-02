provider "aws" {
  region = var.region
  access_key = "${var.scalr_aws_access_key}"
  secret_key = "${var.scalr_aws_secret_key}"
}



resource "aws_instance" "oleg-tf" {
  ami = "${var.image_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
}
