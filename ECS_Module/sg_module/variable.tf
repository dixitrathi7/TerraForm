variable "ecs_from_port_r1" {
  description = "Enter the Port on which your Load Balancer is listing"
  type = number
  default = 80
}

variable "ecs_to_port_r1" {
  description = "Enter the Port on which your Load Balancer is listing"
  type = number
  default = 80
}

variable "vpc_id" {
    description = "Get vpc ID from vpc module"
  
}