#====================================================================================================
# security group for bastion host
#====================================================================================================
resource "aws_security_group" "publicSG" {
    name = "securityGroupforWeb"
    description = "This security group for frountend application"
    vpc_id = var.vpc_id

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

     tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-publinc-sg"
  }) 
}

resource "aws_security_group_rule" "public_ingress" {
  count             = length(var.public_ports_open)
  type              = "ingress"
  from_port         = element(var.public_ports_open, count.index)
  to_port           = element(var.public_ports_open, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.publicSG.id

  description       = "Allow port ${element(var.public_ports_open, count.index)} from public"
}

#===================================================================================================
# private security group for backend application
#===================================================================================================
resource "aws_security_group" "privateSG" {
    name = "securityGroupforApp"
    description = "This security group for backend application"
    vpc_id = var.vpc_id
    
    
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = [var.vpc_cidr_range]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = [var.vpc_cidr_range]
    }

     tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-private-sg"
  }) 
    
}