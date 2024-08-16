resource "aws_lb_target_group" "jenkins_alb_tg" {
  name     = var.tg_name
  port     = var.tg_forward_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = var.tg_target_type 

  health_check {
    path                = var.tg_health_path  # Health check path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.tg_tag_name
  }

  depends_on = [ aws_instance.jenkins_server ]
}

# Register Jenkins EC2 instances with this target group


resource "aws_lb_target_group_attachment" "ec2_register_tg" {
  
    target_group_arn  = aws_lb_target_group.jenkins_alb_tg.arn
    target_id         = aws_instance.jenkins_server.id
    port              = var.tg_register_port

    depends_on = [ aws_lb_target_group.jenkins_alb_tg ]
}