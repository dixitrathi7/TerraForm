
variable "vpc_cidr_range" {
    description = "Define your VPC CIDR range"
    default = "10.0.0.0/16"
}

variable "PublicSubnet_cidr_range_1a" {
    description = "Define your Public Subnet CIDR range"
    default = "10.0.1.0/24"
}

variable "PublicSubnet_cidr_range_1b" {
    description = "Define your Public Subnet CIDR range"
    default = "10.0.2.0/24"
}
variable "vpc_tag" {
    description = "Define what is the name of your vpc"
    default = "my_vpc"
}

variable "PublicSubnet_tag" {
    description = "Define what is the name of your Public subnet"
    default = "Pub_sub"
}

variable "igw_tag" {
    description = "What is your Internet Gateway Name"
    default = "my_vpc_igw"
}

variable "pub_rt_route" {
    description = "Define Route for every one can access our Public subnet through internet gateway"
    default = "0.0.0.0/0"  
}

variable "availability_zone_1a" {
    default = "us-east-1a"
}

variable "PrivateSubnet_tag_1a" {
    description = "Define what is the name of your Private subnet"
    default = "Pvt_sub"
}

variable "PrivateSubnet_cidr_range_1a" {
    description = "Define your Public Subnet CIDR range"
    default = "10.0.11.0/24"
}

variable "PrivateSubnet_cidr_range_1b" {
    description = "Define your Public Subnet CIDR range"
    default = "10.0.12.0/24"
}

variable "availability_zone_1b" {
    default = "us-east-1b"
}

variable "LB_SG_id" {
  description = "Pass the security Group for vpc endpoint"
}

variable "ecsRegion" {
  description = "Pass your working resion to vpc endpoint"
}