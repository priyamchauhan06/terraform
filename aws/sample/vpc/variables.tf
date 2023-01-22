variable "region" {
  description = "aws region in which deployment has to be done"
}
variable "aws_access_key" {
  description = "aws access key"
}
variable "aws_secret_key" {
  description = "aws secret key"
}

variable "vpc_cidr_range" {
  description = "IP Range of vpc to be created"
  default     = "10.1.0.0/16"
}

variable "pvt_subnet_cidr_range" {
  description = "IP Range of private to be created"
  default     = "10.1.0.0/24"
}

variable "pub_subnet_cidr_range" {
  description = "IP Range of public subnet to be created"
  default     = "10.1.0.1/24"
}

