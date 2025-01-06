variable "vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs."
}

variable "db_username" {
  type        = string
  description = "RDS DB username."
}

variable "db_password" {
  type        = string
  description = "RDS DB password."
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources."
  default     = {}
}
