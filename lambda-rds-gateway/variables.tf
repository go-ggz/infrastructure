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

variable "project" {
  description = "default project name"
  default     = "ggz"
}
