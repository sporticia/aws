variable "aws_region" {
  description = "AWS Region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Name of SCP policy."
  type        = string
  default     = "ForceEBSEncryption"
}
