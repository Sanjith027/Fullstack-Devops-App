variable "aws_region" {
  default     = "us-east-1"   # ✅ You asked to fix this line only
  description = "AWS region"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  default     = "t3.small"    # ✅ You’re now using t3.small for better performance
  description = "EC2 instance type"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The master username for RDS"
  type        = string
}

variable "db_password" {
  description = "The master password for RDS"
  type        = string
  sensitive   = true
}
