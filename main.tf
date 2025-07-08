provider "aws" {
  region = var.region
  access_key = AKIAQNGLNHNF74TY6TQH
  secret_key = gcoF4YzSII7XrYyHRpdEK3Jhm+C93u+zvgBpZ/q5y
}
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}
