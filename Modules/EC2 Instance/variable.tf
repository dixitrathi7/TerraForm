variable "region" {
  description = "i use us-east-1 region"
  default = "us-east-1"
}

variable "inst_count" {
  description = "Number of instances to launch"
  type        = number
  default = 1
}

variable "inst_ami" {
  description = "AMI ID for the instance"
  default = "ami-0b72821e2f351e396"
}

variable "inst_type" {
  description = "Instance type for the EC2 instance"
  default = "t2.micro"
}

variable "inst_security_group" {
  description = "Security group ID for the instance"
  default = ["default"]
}

variable "inst_pem_key" {
  description = "Name of the PEM key pair used for SSH access"
}

variable "inst_availability_zone" {
  description = "In which Availability Zone you want to launch your EC2 instance"
  default = "us-east-1b"
}

variable "inst_subnet_id" {
  description = "In which subnet you want to launch your resource"
}