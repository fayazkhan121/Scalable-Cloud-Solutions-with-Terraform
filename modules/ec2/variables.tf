variable "vpc_id" {
  type        = string
  description = "ID of the VPC."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs."
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type."
}

variable "allowed_ssh_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR block allowed to SSH into EC2."
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply."
  default     = {}
}
