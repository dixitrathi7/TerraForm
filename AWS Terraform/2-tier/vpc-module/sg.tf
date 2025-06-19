resource "aws_security_group" "privateSG" {
    name = "securityGroupforApp"
    description = "This security group for backend application"
    vpc_id = aws_vpc.myvpc.id
    
    
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
    depends_on = [ aws_vpc.myvpc ]
    
}