variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block."
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs."
}

variable "region" {
  type        = string
  description = "AWS region."
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources."
  default     = {}
}
