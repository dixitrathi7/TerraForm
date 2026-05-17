provider "aws" {
  region = var.region
  access_key = ""	
  secret_key = ""	
}

module "networking" {
  source = "./modules/networking"
  dynamodb_table_name  = var.dynamodb_table_name
  project              = var.project
  environment          = var.environment
  region               = var.region
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}

module "jenkins" {
  source = "./modules/jenkins"
  project              = "${var.project}"
  environment          = "${var.environment}"
  region               = var.region  
  jenkins_key          = "${var.jenkins_key}"
  jenkins_instance     = "${var.jenkins_instance}"
  public_subnets_id    = [module.networking.public_subnets_id[0],module.networking.public_subnets_id[1]]
  vpc_id               = module.networking.vpc_id
  vpc_cidr             = var.vpc_cidr
}