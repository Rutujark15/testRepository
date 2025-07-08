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
