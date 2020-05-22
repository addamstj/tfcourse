provider "aws" {
  region = "eu-west-2"
}
provider "aws" {
  region = "eu-west-1"
  alias  = "ireland"
}

resource "aws_vpc" "lndvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "irlvpc" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.ireland
}
