resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.public_subnet : subnet.id]

tags = merge(local.common_tags, {
    Name        = "${var.project}-${var.environment}-public-nacl"
  })

  dynamic "egress" {
    for_each = [for rule_obj in local.public_egress_nacl_rules : {
      protocol   = rule_obj.protocol
      from_port  = rule_obj.from_port
      to_port    = rule_obj.to_port
      rule_no    = rule_obj.rule_num
      cidr_block = rule_obj.cidr
      action     = rule_obj.action
    }]
    content {
      protocol   = egress.value["protocol"]
      rule_no    = egress.value["rule_no"]
      action     = egress.value["action"]
      cidr_block = egress.value["cidr_block"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }

  dynamic "ingress" {
     for_each = [for rule_obj in local.public_ingress_nacl_rules : {
      protocol   = rule_obj.protocol
      from_port  = rule_obj.from_port
      to_port    = rule_obj.to_port
      rule_no    = rule_obj.rule_num
      cidr_block = rule_obj.cidr
      action     = rule_obj.action
    }]
    content {
      protocol   = ingress.value["protocol"]
      rule_no    = ingress.value["rule_no"]
      action     = ingress.value["action"]
      cidr_block = ingress.value["cidr_block"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }

}

#====================================================================
# NACL Rule for private-subnets
#====================================================================

resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.private_subnet : subnet.id]

tags = merge(local.common_tags, {
    Name        = "${var.project}-${var.environment}-private-nacl"
  })

  dynamic "egress" {
    for_each = [for rule_obj in local.private_egress_nacl_rules : {
      protocol   = rule_obj.protocol
      from_port  = rule_obj.from_port
      to_port    = rule_obj.to_port
      rule_no    = rule_obj.rule_num
      cidr_block = rule_obj.cidr
      action     = rule_obj.action
    }]
    content {
      protocol   = egress.value["protocol"]
      rule_no    = egress.value["rule_no"]
      action     = egress.value["action"]
      cidr_block = egress.value["cidr_block"]
      from_port  = egress.value["from_port"]
      to_port    = egress.value["to_port"]
    }
  }

  dynamic "ingress" {
     for_each = [for rule_obj in local.private_ingress_nacl_rules : {
      protocol   = rule_obj.protocol
      from_port  = rule_obj.from_port
      to_port    = rule_obj.to_port
      rule_no    = rule_obj.rule_num
      cidr_block = rule_obj.cidr
      action     = rule_obj.action
    }]
    content {
      protocol   = ingress.value["protocol"]
      rule_no    = ingress.value["rule_no"]
      action     = ingress.value["action"]
      cidr_block = ingress.value["cidr_block"]
      from_port  = ingress.value["from_port"]
      to_port    = ingress.value["to_port"]
    }
  }

}
