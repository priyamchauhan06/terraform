variable "region" {
  description = "aws region in which deployment has to be done"
}

variable "vpC_cidr_range" {
  description = "IP Range of vpc to be created"
  default     = "10.0.0.0/16"
}
