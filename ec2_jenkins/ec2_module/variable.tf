
// from here security group variable is mention 

variable "vpc_id" {
    description = "Give the VPC ID in which VPC you want to launch your Jenkins EC2 Server"
}

variable "alb_sg_name" {
    description = "Give the Application Load Balancer Security Group Name"
    default = "alb_sg"
}

variable "alb_sg_tag" {
    description = "Give what tag you want to assign to your Application Load Balancer Security Group"
    default = "jenkins_sg"
}

variable "jenkins_port" {
    description = "Mention On what port your jenkins is trffic that come from load balancer"
    type = number
    default = 80
}

variable "jenkins_sg_name" {
    description = "give the name of your jenkins security group"
    default = "jenkins_sg"
}

variable "jenkins_sg_tag" {
    description = "Tag your jenkins security group"
    default = "jenkins_sg"
}


// from here jenkins ec2 instance variable is start 

variable "ec2_count" {
  description = "Number of jenkins instances you want to launch"
  type        = number
  default = 1
}

variable "ec2_ami" {
  description = "AMI ID for the jenkins instance"
  default = "ami-0b72821e2f351e396"
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  default = "t2.micro"
}

variable "ec2_public_key" {
  description = "Name of the PEM key pair used for SSH access"

}

variable "ec2_tag" {
  description = "Tag your ec2 instance that you want to launch"
  default = "jenkins_tag"
}

variable "ec2_subnet_id" {
  description = "mention the subnet in which subnet you want to launch your ec2 instance"  
  
}

variable "user_data" {
  description = "User data script to initialize the EC2 instance"
  type        = string
  default     = ""
}


# from here the target group variable is start 

variable "tg_name"{
  description = "Define the name of your target group"
  default = "jenkinsTGname"
}



variable "tg_target_type" {
  description = " Mention your target type wather it is instance, ip, container and load balancer"
  default =   "instance"
}

variable "tg_forward_port" {
  description = "Mention the port on which your application is listen"
  type = number
  default = 80
}

variable "tg_health_path" {
  description = "mention your health check path of which target group check the health of your server"
  default = "/" 
}

variable "tg_tag_name" {
  description = "give the tag of your target group"
  default = "tg_jenkins"
}

variable "tg_register_port" {
  description = "Port on which your ec2 instance is register port with target gropu"
  type = number
  default = 80
}


# from here Application load balancer variable is start 

variable "alb_name" {
  description = "define the name of your application load balancer name "
  default = "terraLB"
}

variable "LB_facing" {
  description = "your load balancer is internal or internet facing "
  type = bool
  default = false
}

variable "lb_type" {
  description = "what is the type of your load balancer wather it is application, network and classic load balancer "
  default = "application"
  
}

variable "alb_ipa_type" {
  description = "what is the ip of your load balancer"
  default = "ipv4"
}

variable "alb_tag_name" {
  description = "what is the tag you want to mention to your load balancer"
  default = "app_alb_tag"
  
}

variable "alb_port" {
  type = number
  default = 80
  
}