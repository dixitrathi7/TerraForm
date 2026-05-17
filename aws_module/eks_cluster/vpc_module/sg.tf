
resource "aws_security_group" "node_group_sg" {
  name        = "security_Group_ecs_lb"
  description = "This security group for ECS Loab Balancer"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Use -1 to allow all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  # Use -1 to allow all protocols
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.name_node_sg
  }
}