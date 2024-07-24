module "launch_vpc" {
    source = "./VPC_module"
    vpc_cidr_range = var.vpc_cidr_range
    PublicSubnet_cidr_range = var.PublicSubnet_cidr_range
    PrivateSubnet_cidr_range = var.PrivateSubnet_cidr_range
    PublicSubnet_availability_zone = var.PublicSubnet_availability_zone
    PrivateSubnet_availability_zone = var.PrivateSubnet_availability_zone
}

module "security_group_module" {
    source = "./SecurityGroup"
    vpc_id = module.VPC.vpc_id
  
}

module "launch_ec2" {
    source = "./EC2_module"
    inst_pem_key  = var.inst_pem_key  
    inst_subnet_id = var.inst_subnet_id

}

