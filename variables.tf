variable "aws_region" {
  type    = string
  default = "us-east-1"
  description = "AWS region to deploy resources in."
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
  description = "CIDR block for the main VPC."
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of public subnet CIDRs."
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "List of private subnet CIDRs."
}

variable "db_username" {
  type        = string
  default     = "admin"
  description = "Database username for RDS."
}

variable "db_password" {
  type        = string
  description = "Database password for RDS."
  sensitive   = true
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type."
}

variable "allowed_ssh_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR block allowed to access EC2 instances via SSH. (Change in production!)"
}
