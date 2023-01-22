variable "region" {
  description = "aws region in which deployment has to be done"
  type = string
  default = "ap-south-1"
}
variable "aws_access_key" {
  description = "aws access key"
  type = string
}
variable "aws_secret_key" {
  description = "aws secret key"
  type = string
}

variable "vpc_cidr_range" {
  description = "IP Range of vpc to be created"
  type = string
  default     = "10.1.0.0/16"
}

variable "pvt_subnet_cidr_range" {
  description = "IP Range of private to be created"
  type = string
  default     = "10.1.0.0/24"
}

variable "pub_subnet_cidr_range" {
  description = "IP Range of public subnet to be created"
  type = string
  default     = "10.1.1.0/24"
}

