variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami" {
  description = "Mapping of region to AMI IDs"
  type        = string
}

variable "name" {
  description = "Name of instance"
  type        = string
}


