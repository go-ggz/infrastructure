variable "aws_access_key" {
  description = "aws access key."
}

variable "aws_secret_key" {
  description = "aws secret key."
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

variable "ssh_public_key" {
  description = "The public key material. SSH public key file format as specified in RFC4716"
}

variable "project" {
  description = "default project name"
  default     = "ggz"
}
