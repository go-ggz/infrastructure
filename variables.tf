variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_vpc_id" {}

variable "aws_subnet_id_a" {}
variable "aws_subnet_id_c" {}

variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "environment" {
  default = "staging"
}

variable "amis" {
  type = "map"

  #
  # http://www.ubuntu.com/cloud/services
  #
  default = {
    ap-southeast-1 = "ami-81cefcfd"
  }
}

variable "instance_text" {
  description = "The text the EC2 Instance should return when it gets an HTTP request."
  default     = "Hello, World!"
}

variable "instance_port" {
  description = "The port the EC2 Instance should listen on for HTTP requests."
  default     = 8080
}
