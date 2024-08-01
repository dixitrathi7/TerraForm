resource "aws_lb_target_group" "ecs_tg" {
  name        = "ecs-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  /*health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
*/
  tags = {
    Name = "ecs-lb-tg"
  }
}
