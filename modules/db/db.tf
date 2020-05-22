resource "aws_instance" "myec2db" {
  ami           = "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}
