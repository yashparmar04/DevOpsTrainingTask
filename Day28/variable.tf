variable "region_name" {
  description = "Selected Region"
  type        = string
  default     = "us-west-2"
}
variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0aff18ec83b712f05"
}
variable "ec2_type" {
  description = "EC2 Type"
  type        = string
  default     = "t2.micro"
}
variable "db_name" {
  description = "Database Name"
  type        = string
  default     = "ypdatabase"
}
variable "db_user" {
  description = "Database User"
  type        = string
  default     = "admin"
}
variable "db_password" {
  description = "Database Password"
  type        = string
  default     = "mypassword"
}
