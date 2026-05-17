# Internet gateway for the public subnet

resource "aws_internet_gateway" "refactorq_internet_gateway" {
  vpc_id = aws_vpc.vpc.id

 tags = merge(local.common_tags, {
     Name        = "${var.project}-internet_gateway"
  })
}

/* Elastic IP for NAT */

resource "aws_eip" "refactorq_nat_eip" {
  #vpc        = true
  domain = "vpc"
  depends_on = [aws_internet_gateway.refactorq_internet_gateway]
}

/* NAT Gateway */

resource "aws_nat_gateway" "refactorq_nat_gateway" {
  allocation_id = aws_eip.refactorq_nat_eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
  depends_on    = [aws_internet_gateway.refactorq_internet_gateway]

  tags = merge(local.common_tags, {
     Name         = "${var.project}-nat_gateway"
  })
}