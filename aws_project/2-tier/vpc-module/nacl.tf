# Public NACL
resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.myvpc.id

  tags = merge(local.common_tags, {
    Name = "${var.environment}-${var.project}-public-nacl"
  })
  depends_on = [aws_subnet.PublicSubnetweb]
}

resource "aws_network_acl_association" "public_nacl_association" {
  network_acl_id = aws_network_acl.public_nacl.id
  subnet_id      = aws_subnet.PublicSubnetweb.*.id
}

# Public Ingress NACL Rule
resource "aws_network_acl_rule" "public_ingress" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  protocol       = -1
  rule_action    = "allow"
  egress         = false  # Ingress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

# Public Egress NACL Rule
resource "aws_network_acl_rule" "public_egress" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  protocol       = -1
  rule_action    = "allow"
  egress         = true  # Egress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
#====================================================================
# Private NACL
#====================================================================
resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.myvpc.id

  tags = merge(local.common_tags, {
    Name = "${var.environment}-${var.project}-private-nacl"
  })
  depends_on = [aws_subnet.PrivateSubnetapp]
}

resource "aws_network_acl_association" "private_nacl_association" {
  network_acl_id = aws_network_acl.private_nacl.id
  subnet_id      = aws_subnet.PrivateSubnetapp.*.id
}
# Private Ingress NACL Rules
resource "aws_network_acl_rule" "private_ingress_1" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  protocol       = -1
  rule_action    = "allow"
  egress         = false  # Ingress rule
  cidr_block     = var.vpc_cidr_range  # Assuming var.vpc_cidr is defined
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_ingress_2" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 101
  protocol       = -1
  rule_action    = "allow"
  egress         = false  # Ingress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_ingress_3" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 200
  protocol       = 6  # TCP
  rule_action    = "allow"
  egress         = false  # Ingress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 32768
  to_port        = 65535
}

# Private Egress NACL Rules
resource "aws_network_acl_rule" "private_egress_1" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  protocol       = -1
  rule_action    = "allow"
  egress         = true  # Egress rule
  cidr_block     = var.vpc_cidr_range  # Assuming var.vpc_cidr is defined
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_egress_2" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 200
  protocol       = 6  # TCP
  rule_action    = "allow"
  egress         = true  # Egress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 32768
  to_port        = 65535
}

resource "aws_network_acl_rule" "private_egress_3" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 300
  protocol       = 6  # TCP
  rule_action    = "allow"
  egress         = true  # Egress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "private_egress_4" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 400
  protocol       = 6  # TCP
  rule_action    = "allow"
  egress         = true  # Egress rule
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}
