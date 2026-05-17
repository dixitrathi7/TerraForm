# variable "company" {
#   description = "The name of the company"
#   default = "RefactorQ"
# }
variable "project" {
  description = "The name of the project"
  default = "AutomationTesting"
}
variable "managedby" {
  description = "Stack managed by"
  default = "terraform"
}
variable "environment" {
  description = "The deployment environment"
  default     = "stage"
}

variable "region" {
  description = "The AWS Region"
  default     = "us-east-1"
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
  description = "The CIDR block for the app private subnet"
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
variable "jenkins_instance" {
  description = "instace type of a jenkins"
  default     = "t3.large"
}
variable "jenkins_key" {
  description = "Key pair for jenkins instance"
  default     = "zinrelo-jenkins-key"
}
