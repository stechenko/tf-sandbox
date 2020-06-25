variable "region" {
  type = string
}

variable "image_id" {
  type = string
  default = "ami-07d0cf3af28718ef8"
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
  default = "subnet-3d82d101"
}

variable "blank" {
  description = "Blank string"
  default = ""
}
