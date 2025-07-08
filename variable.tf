variable "region" {
  description = "AWS region"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}
variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}
