
variable "inst_count" {
  description = "Number of instances to launch"
  default     = 2
  type        = number
}

variable "inst_ami" {
  description = "AMI ID for the instance"
  default     = "ami-0b72821e2f351e396"
}

variable "inst_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "inst_pem_key" {
  description = "Name of the PEM key pair used for SSH access"
  default     = "dixit-n-virg"
}
