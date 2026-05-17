variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default = "demo_cluster"
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "Pub_subnet_id_1a" {
  description = "A list of subnet IDs where the EKS cluster will be deployed"
  type        = string
}
variable "Pub_subnet_id_1b" {
  description = "A list of subnet IDs where the EKS cluster will be deployed"
  type        = string
}

variable "Pvt_subnet_id_1a" {
  description = "A list of subnet IDs where the EKS cluster will be deployed"
  type        = string
}

variable "Pvt_subnet_id_1b" {
  description = "A list of subnet IDs where the EKS cluster will be deployed"
  type        = string
}


variable "eks_cluster_role_arn" {
  description = "The ARN of the IAM role to use for the EKS cluster"
  type        = string
}

variable "eks_node_role_arn" {
  description = "The ARN of the IAM role to use for the EKS node group"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type to use for the EKS node group"
  type        = string
  default     = "t3a.medium"
}

variable "desired_capacity" {
  description = "The desired capacity of the EKS node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum size of the EKS node group"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "The minimum size of the EKS node group"
  type        = number
  default     = 1
}

variable "node_group_sg_id" {
  type = string
}

variable "ec2_ssh_key_name" {
  default = "dixit-n-virg"
}
