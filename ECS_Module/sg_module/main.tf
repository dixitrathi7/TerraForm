
resource "aws_security_group" "LB_SG" {
  name        = "security_Group_ecs_lb"
  description = "This security group for ECS Loab Balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    from_port        = 443
    to_port          = 443
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
    Name = "ECR SG"
  }
}

resource "aws_security_group" "ECS_SG" {
  name        = "security_Group_for_ecr"
  description = "This security group for ecs Task and service "
  vpc_id      = var.vpc_id

  ingress {
    from_port        = var.ecs_from_port_r1
    to_port          = var.ecs_to_port_r1
    protocol         = "tcp"
    security_groups = [aws_security_group.LB_SG.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ECR_SG"
  }
}
