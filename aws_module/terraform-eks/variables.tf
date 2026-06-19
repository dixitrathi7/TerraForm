variable "kubernetes_version" {
  default     = "1.35"
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "ap-south-1"
  description = "aws region"
}

variable "node_group_desired_size" {
  default     = 1
  description = "Desired number of worker nodes in the EKS managed node group"
}

variable "node_group_min_size" {
  default     = 1
  description = "Minimum number of worker nodes in the EKS managed node group"
}

variable "node_group_max_size" {
  default     = 2
  description = "Maximum number of worker nodes in the EKS managed node group"
}

