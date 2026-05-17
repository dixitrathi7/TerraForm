locals {
  common_tags = {
    #company      = "${var.company}"
    Environment = "${var.environment}"
    ManagedBy = "${var.managedby}"
    cost_ignore = "${var.cost_ignore}"
  }

  public_ingress_nacl_rules = [
    { protocol: -1, from_port : 0, to_port : 0,  rule_num : 100, cidr : "0.0.0.0/0", action: "allow" },
  ]

  public_egress_nacl_rules = [
    { protocol: -1, from_port : 0, to_port : 0,  rule_num : 100, cidr : "0.0.0.0/0", action: "allow" }
  ]

  private_ingress_nacl_rules = [
    { protocol: -1, from_port : 0, to_port : 0,  rule_num : 100, cidr : "${var.vpc_cidr}", action: "allow" },
    { protocol: -1, from_port : 0, to_port : 0,  rule_num : 101, cidr : "0.0.0.0/0", action: "allow" },
    { protocol: 6, from_port : 32768, to_port : 65535,  rule_num : 200, cidr : "0.0.0.0/0", action: "allow" }
    ]

  private_egress_nacl_rules = [
    { protocol: -1, from_port : 0, to_port : 0,  rule_num : 100, cidr : "${var.vpc_cidr}", action: "allow" },
    { protocol: 6, from_port : 32768, to_port : 65535,  rule_num : 200, cidr : "0.0.0.0/0", action: "allow" },
    { protocol: 6, from_port : 80, to_port : 80,  rule_num : 300, cidr : "0.0.0.0/0", action: "allow" },
    { protocol: 6, from_port : 443, to_port : 443,  rule_num : 400, cidr : "0.0.0.0/0", action: "allow" }
  ]
}