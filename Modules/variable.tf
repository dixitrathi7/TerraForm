variable "region" {
    description = "define the working region"
    default = "us-east-1"
}

variable "inst_pem_key" {
}

variable "inst_subnet_id" {
    default = "subnet-0077fedd05526ece7" 
}

variable "vpc_cidr_range" {}

variable "PublicSubnet_cidr_range" {}

variable "PrivateSubnet_cidr_range" {}

variable "PublicSubnet_availability_zone" {}

variable "PrivateSubnet_availability_zone" {}

variable "vpc_id" {
  
}
