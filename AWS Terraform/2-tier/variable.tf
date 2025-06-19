
variable "vpc_cidr_range" {
    type = string
}

variable "PublicSubnet_cidr_range" {
    type        = list(any)
}

variable "PrivateSubnet_cidr_range" {
    type        = list(any)
}

variable "PublicSubnet_availability_zone" {
    type        = list(any)
}

variable "PrivateSubnet_availability_zone" {
    type        = list(any)
}

variable "environment" {
    type = string
}

variable "project" {
    type = string
}

variable "cg-ami" {
  
}

variable "cg-inst-type" {
  
}

variable "cg-inst_pem_key" {
  
}


# bastion host variable 

variable "b_inst_ami" {
  description = "provide the bastion host server AMI"
}

variable "b_inst_type" {
  description = "provide the bastion host server instance type"
}

variable "b_inst_sg" {
  description = "provide the bastion host server security group ID"
  type        = list(string)  # Change to list of strings (or set(string) if you prefer a set)
  default     = ["default"] 
}

variable "b_inst_pem_key" {
  description = "provide the pem key here for bastion host server for cloud guardian"
}

variable "lb-sg-id" {
  description = "Provide the security group id for load balancer security group id"
}

variable "public_ports_open" {
  description = "A list of TCP ports to open to the internet (0.0.0.0/0) for the public security group."
  type        = list(number)
}