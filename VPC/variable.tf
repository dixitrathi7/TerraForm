variable "region" {
    description = "Define your working aws region in which you launch resources"
    default = "ap-south-1"
}

variable "vpc_cidr_range" {
    description = "Define your VPC CIDR range"
    default = "10.0.0.0/16"
}

variable "PublicSubnet_cidr_range" {
    description = "Define your Public Subnet CIDR range"
    default = "10.0.1.0/24"
}

variable "PrivateSubnet_cidr_range" {
    description = "Define your Public Subnet CIDR range"
    default = "10.0.2.0/24"
}

variable "vpc_tag" {
    description = "Define what is the name of your vpc"
    default = "TF_vpc"
}

variable "PublicSubnet_tag" {
    description = "Define what is the name of your Public subnet"
    default = "Pub_sub"
}

variable "PrivateSubnet_tag" {
    description = "Define what is the name of your Private subnet"
    default = "Pvt_sub"
}

variable "igw_tag" {
    description = "What is your Internet Gateway Name"
    default = "tf_igw"
}

variable "pub_rt_route" {
    description = "Define Route for every one can access our Public subnet through internet gateway"
    default = "0.0.0.0/0"  
}













