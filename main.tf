provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}
