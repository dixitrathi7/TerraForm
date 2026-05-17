
/*==== VPC's Default Security Group ======*/
resource "aws_security_group" "default" {
  name        = "${var.project}-default-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [aws_vpc.vpc]

  /* Allow only ssh traffic from internet */
  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "TCP"
    self      = true
    cidr_blocks      = [var.vpc_cidr]
  
  }

  /* Allow all outbound traffic to internet */
  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

   tags = merge(
    {
      Name = "${var.project}-default-sg",
    },
    local.common_tags
  )

}



#========================
# Create Security Group
resource "aws_security_group" "services" {
  name        = "terraform_services"
  description = "AWS security group for terraform"
  vpc_id      = aws_vpc.vpc.id

  # Input
  ingress {
    from_port   = "1"
    to_port     = "65365"
    protocol    = "TCP"
    cidr_blocks = [var.vpc_cidr]
  }

  # Output
  egress {
    from_port   = 0             # any port
    to_port     = 0             # any port
    protocol    = "-1"          # any protocol
    cidr_blocks = ["0.0.0.0/0"] # any destination
  }

  # ICMP Ping 
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = merge(
    {
      Name = "security, group, aws, vpc1",
    },
    local.common_tags
  )
}