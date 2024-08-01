variable "ecsRegion" {
  description = "Provide the working region"
  default = "us-east-1"
  
}

variable "family_name_task_def" {
  description = "Enter the name of your task definition"
  default = "New_Task_Def"
  
}

variable "launch_types" {
  description = "where Amazon ECS launches the task or service Whether it is Server less(FARGATE) or EC2"
  default = ["FARGATE"]
}

variable "Task_Networking_mode" {
  description = "type of networking the containers in the task use"
  default = "awsvpc"
  
}

variable "iam_role_arn" {
  description = "arn of role"
}

variable "task_cpu" {
  description = "specify the amount of CPU is reserve for the task"  
  type = number
  default = 1024
}

variable "task_memory" {
  description = "specify the amount of memory is reserve for the task"  
  type = number
  default = 2048
}

variable "define_image" {
  description = "Give Image URL you are going to use"
}

variable "container_cpu" {
  description = "how much cpu are allocated to the container"
  type = number
  default = 1024
  
}

variable "container_memory" {
  description = "how much memory are allocated to the container"
  type = number
  default = 2048
  
}

variable "container_port" {
  description = "Provide the port number on which your container is listening"
  type = number
}

variable "host_port" {
  description = "Provide the port number on which your host machine is listening"
  type = number
}

variable "cluster_name" {
  description = "Give the name fo your Cluster"
  default = "my_ecs_cluster"
}

variable "ecs_service_name" {
  description = "Provide the name of your cluster service"
  default = "my_ecs_service"
}

variable "service_launch_types" {
  description = "Enter the launch type"
  default = "FARGATE"
}

variable "desired_no_count" {
  description = "Enter the Number to Replica you want to run"
  type = number
  default = 1
}

variable "Pvt_subnet_id_1a" {
  description = "Sebnet ID pass here from vpc module for cluster service"
}

variable "Pub_subnet_id_1a" {
  description = "Sebnet ID pass here from vpc module for cluster service"
}


variable "ECS_SG_id" {
  description = "Sebnet ID pass here from vpc module for cluster service"
}

variable "ecs_tg_arn" {
  description = "Pass the Target group arn for load balancer to ecs service run different task "
}
