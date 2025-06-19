provider "aws" {
  region = "us-east-1"
}

module "launch_vpc" {
  source = "./vpc-module"
  environment = var.environment
  project = var.project
  vpc_cidr_range = var.vpc_cidr_range
  PublicSubnet_cidr_range = var.PublicSubnet_cidr_range
  PrivateSubnet_cidr_range = var.PrivateSubnet_cidr_range
  PublicSubnet_availability_zone = var.PublicSubnet_availability_zone
  PrivateSubnet_availability_zone = var.PrivateSubnet_availability_zone
}

module "launch_ec2" {
  source = "./ec2-module"
  environment = var.environment
  project = var.project
  vpc_id = module.launch_vpc.vpc_id
  vpc_cidr_range = var.vpc_cidr_range

  cg-inst_ami = var.cg-ami
  cg-inst_type = var.cg-inst-type
  inst_subnet_id = module.launch_vpc.private_subnet_id
  cg-inst-Az = var.PrivateSubnet_availability_zone
  cg-inst_pem_key = var.cg-inst_pem_key
  public_ports_open = var.public_ports_open

  # bastion host ec2 instance variable

  b_inst_pem_key = var.b_inst_pem_key
  b_inst_Az = module.launch_vpc.PublicSubnet_availability_zone
  b_inst_subnet_id = module.launch_vpc.public_subnet_id
  b_inst_ami = var.b_inst_ami
  b_inst_type = var.b_inst_type
  b_inst_sg = var.b_inst_sg  
  

}

