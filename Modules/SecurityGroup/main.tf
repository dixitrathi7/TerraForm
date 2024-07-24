resource "aws_security_group" "WebSG" {
  name        = "securityGroupforWeb"
  description = "This security group for web application"
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
    Name = "Web SG"
  }
}


resource "aws_security_group" "AppSG" {
    name = "securityGroupforApp"
    description = "This security group for backend application"
    vpc_id = var.vpc_id
    
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = ["11.0.0.0/16"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["11.0.0.0/16"]
    }

    tags = {
      Name = "App SG"
    }
    
}