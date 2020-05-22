provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}

module "dbserver" {
  source = "./db"
}
