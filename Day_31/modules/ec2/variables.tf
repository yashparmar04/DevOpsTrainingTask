variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "Public subnet IDs"
  type        = string
}

variable "web_sg_id" {
  description = "Security group ID for the web server"
  type        = string
}
