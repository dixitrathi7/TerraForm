variable "company" {
  description = "The name of the company"
  default = "Zinrelo"
}
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

variable "cost_ignore" {
  type        = bool
  description = "set true if want to ingore cost"
  default     = false
}

variable "public_subnets_id" {
  type        = list(any)
  description = "The names of the public subnet to use"
}
variable "vpc_id" {
  description = "vpc id for eks cluster"
}
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "jenkins_instance" {
  description = "instace type of a jenkins"
  default     = "t3.large"
}
variable "jenkins_key" {
  description = "Key pair for jenkins instance"
  default     = "zinrelo-jenkins-key"
}

# variable "domain" {
#   description = "domain name for certificate"
#   default     = "*.refactorq.com"
# }
