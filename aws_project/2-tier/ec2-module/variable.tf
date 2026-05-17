variable "project" {
  description = "The name of the project"
}

variable "environment" {
  description = "The deployment environment"
}

variable "vpc_id" {
}

variable "vpc_cidr_range" {
  description = "CIDR range for the VPC"
}

variable "inst_count" {
  description = "Number of instances to launch"
  type        = number
  default = 1
}

variable "cg-inst_ami" {
  description = "AMI ID for the instance"
  default = "ami-0b72821e2f351e396"
}

variable "cg-inst_type" {
  description = "Instance type for the EC2 instance"
  default = "t2.micro"
}

variable "cg-inst_security_group" {
  description = "Security group ID for the instance"
  type        = list(any)  # Change to list of strings (or set(string) if you prefer a set)
  default     = ["default"]  
}

variable "cg-inst_pem_key" {
  description = "Name of the PEM key pair used for SSH access"
}

variable "cg-inst-Az" {
  description = "In which Availability Zone you want to launch your EC2 instance"
 # default = "us-east-1b"
}

variable "inst_subnet_id" {
  description = "In which subnet you want to launch your resource"
}


variable "b_inst_ami" {
  
}

variable "b_inst_type" {
  
}

variable "b_inst_sg" {
  description = "Security group ID for the instance"
  type        = list(string)  # Change to list of strings (or set(string) if you prefer a set)
  default     = ["default"] 
  
}

variable "b_inst_pem_key" {
  
}

variable "b_inst_subnet_id" {
  
}

variable "b_inst_Az" {
  
}


variable "public_ports_open" {
  description = "A list of TCP ports to open to the internet (0.0.0.0/0) for the public security group."
  type        = list(number)
}
