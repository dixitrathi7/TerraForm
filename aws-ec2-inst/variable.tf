variable "region" {
  description = "i use us-east-1 region"
}

variable "inst_count" {
  description = "Number of instances to launch"
  type        = number
}

variable "inst_ami" {
  description = "AMI ID for the instance"
}

variable "inst_type" {
  description = "Instance type for the EC2 instance"
}

variable "inst_security_group" {
  description = "Security group ID for the instance"
}

variable "inst_pem_key" {
  description = "Name of the PEM key pair used for SSH access"
}
