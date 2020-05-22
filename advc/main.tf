provider "aws" {
  region = "eu-west-2"
}

variable "vpcname" {
  type = string
}


resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpcname
  }
}

