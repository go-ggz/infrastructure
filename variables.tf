variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "environment" {
  default = "staging"
}

variable "AMIS" {
  type = "map"

  #
  # http://www.ubuntu.com/cloud/services
  #
  default = {
    ap-southeast-1 = "ami-81cefcfd"
  }
}
