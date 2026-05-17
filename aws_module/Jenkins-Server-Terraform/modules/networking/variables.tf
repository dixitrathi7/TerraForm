# variable "company" {
#   description = "The name of the company"
#   default = "RefactorQ"
# }
variable "managedby" {
  description = "Stack managed by"
  default = "terraform"
}
variable "project" {
  description = "The name of the project"
}

variable "environment" {
  description = "The deployment environment"
}

variable "region" {
  description = "The AWS Region"
}

variable "availability_zones" {
  type        = list(any)
  description = "The names of the availability zones to use"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "cost_ignore" {
  type        = bool
  description = "set true if want to ingore cost"
  default     = false
}
variable "dynamodb_table_name" {
  description = "dynamo db table name to lock state file"
}