variable "region" {
  description = "aws region in which deployment has to be done"
}
variable "aws_access_key" {
  description = "aws access key"
}
variable "aws_secret_key" {
  description = "aws secret key"
}

variable "vpC_cidr_range" {
  description = "IP Range of vpc to be created"
  default     = "10.0.0.0/16"
}
