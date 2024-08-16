resource "aws_lb" "jenkins_alb" {
  name               = var.alb_name
  internal           = var.LB_facing
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.ALB_SG_jenkins.id]
  subnets            = [
    "subnet-0506a5dcc24fc704d",
    "subnet-0077fedd05526ece7"
  ]
  ip_address_type    = var.alb_ipa_type

  tags = {
    Name = var.alb_tag_name
  }

  depends_on = [ aws_lb_target_group.jenkins_alb_tg ]
}


resource "aws_lb_listener" "alb_http" {
  load_balancer_arn = aws_lb.jenkins_alb.arn
  port              = var.alb_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_alb_tg.arn
  }
}

/*
# ALB Listener for HTTPS
resource "aws_lb_listener" "alb_https" {
  load_balancer_arn = aws_lb.jenkins_alb.arn
  port              = 443
  protocol          = "HTTPS"

  # Reference the ACM certificate ARN
  #certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_alb_tg.arn
  }
}*/