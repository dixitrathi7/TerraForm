
variable "vpc_cidr_range" {
    description = "Define your VPC CIDR range"
   
}

variable "PublicSubnet_cidr_range" {
    type        = list(any)
    description = "Define your Public Subnet CIDR range"
   
}

variable "PrivateSubnet_cidr_range" {
    type        = list(any)
    description = "Define your Public Subnet CIDR range"
   
}

variable "pub_rt_route" {
    description = "Define Route for every one can access our Public subnet through internet gateway"
    default = "0.0.0.0/0"  
}

variable "PublicSubnet_availability_zone" {
    type        = list(any)
    
}
variable "PrivateSubnet_availability_zone" {
    type        = list(any)
}

variable "project" {
  description = "The name of the project"
}

variable "environment" {
  description = "The deployment environment"
}