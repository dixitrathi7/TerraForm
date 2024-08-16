resource "aws_security_group" "ALB_SG_jenkins" {
  name        = var.alb_sg_name
  description = "This security group for ECS Loab Balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.alb_sg_tag
  }
}

resource "aws_security_group" "jenkins_SG" {
  name        = var.jenkins_sg_name
  description = "This security group for ecs Task and service "
  vpc_id      = var.vpc_id

  ingress {
    from_port        = var.jenkins_port
    to_port          = var.jenkins_port
    protocol         = "tcp"
    security_groups = [aws_security_group.ALB_SG_jenkins.id]
    
  }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.jenkins_sg_tag
  }
}
