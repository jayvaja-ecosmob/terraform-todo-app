# variables.tf

locals {
  common_tags = {
    Project   = var.project_name
    ManagedBy = "terraform"
  }
}

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used for naming all resources"
  type        = string
  default     = "todo-app"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "todo-eks-cluster"
}

variable "worker_instance_type" {
  description = "EC2 instance type for EKS worker nodes (t3.small is minimum for EKS)"
  type        = string
  default     = "c7i-flex.large"
}

variable "your_ip" {
  description = "Your public IP in CIDR notation e.g. 1.2.3.4/32"
  type        = string
}

variable "public_key_path" {
  description = "Local path to your SSH public key file e.g. ~/.ssh/eks-key.pub"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 1
}
