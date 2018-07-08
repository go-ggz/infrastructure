variable "aws_access_key" {
  description = "aws access key."
}

variable "aws_secret_key" {
  description = "aws secret key."
}

variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-southeast-1"
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

variable "instance_type" {
  description = "EC2 Instance Type."
  default     = "t2.nano"
}
