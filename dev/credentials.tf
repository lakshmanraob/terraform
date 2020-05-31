# AWS Configuration Credentials

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default     = "default"
  description = "The profile to be selected for a particular resource"
  type        = string
}
