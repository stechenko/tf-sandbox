variable "region" {
  type = string
  default = "us-east-1"
}

variable "image_id" {
  type = string
  default = "ami-07d0cf3af28718ef8"
}

variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "subnet_id" {
  type = string
}

variable "scalr_aws_access_key" {
  description = "AWS Access Key (sensitive)"
}

variable "scalr_aws_secret_key" {
  description = "AWS Secret Key (sensitive)"
}
