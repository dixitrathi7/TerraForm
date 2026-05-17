
resource "aws_security_group" "jenkins-alb" {
    #name = "${var.project}-jenkins-load-balancer-sg"
    description = "allow HTTP and HTTPS to jenkins Load Balancer (ALB)"
    vpc_id =  "${var.vpc_id}"

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
  }
    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = merge(local.common_tags, {
    Name        = "${var.project}-jenkins-load-balancer-sg"
  })
}
#===================================================================================================
# Create a single load balancer for jenkins services
#===================================================================================================
resource "aws_alb" "jenkins_alb" {
  internal                   = false
  idle_timeout               = "300"
  security_groups            = ["${aws_security_group.jenkins-alb.id}"]
  subnets                    = ["${var.public_subnets_id[0]}","${var.public_subnets_id[1]}"]
  enable_deletion_protection = true

 tags           = merge(local.common_tags, {
    Name        = "${var.project}-jenkins-load-balancer"
  })
}

# Define a listener
resource "aws_alb_listener" "jenkins" {
  load_balancer_arn = "${aws_alb.jenkins_alb.arn}"
# port              = "443"
# protocol          = "HTTPS"
  port              = "80"
  protocol          = "HTTP"
# ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
# certificate_arn   = "arn:aws:acm:us-east-1:774770074093:certificate/"

  default_action {
    target_group_arn = "${aws_alb_target_group.jenkins_tg.arn}"
    type             = "forward"
  }
}

# Connect jenkins ASG up to the Application Load Balancer
resource "aws_alb_target_group" "jenkins_tg" {
  name     = "${var.project}-jenkins-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  health_check {
    path                = "/login"
    port                = 8080
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}
resource "aws_lb_target_group_attachment" "jenkins_server_tg_attachment" {
  target_group_arn = aws_alb_target_group.jenkins_tg.arn
  target_id        = aws_instance.jenkins_server.id
  port             = 8080
}
resource "aws_alb_listener_rule" "jenkins" {
  listener_arn = "${aws_alb_listener.jenkins.arn}"
  priority     = 100

  action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.jenkins_tg.arn}"
  }

   condition {
    path_pattern {
      values = ["/*"]
    }
  }
}