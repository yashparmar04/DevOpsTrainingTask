variable "master_ami" {
  description = "AMI ID for the Kubernetes master node"
  type        = string
}

variable "worker_ami" {
  description = "AMI ID for the Kubernetes worker nodes"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the Kubernetes nodes"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instances will be deployed"
  type        = string
}

variable "security_group" {
  description = "Security group ID for the instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name to access the instances"
  type        = string
}

variable "instance_name" {
  description = "Base name for the EC2 instances"
  type        = string
  default     = "k8s-node"
}
