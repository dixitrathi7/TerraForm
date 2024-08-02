provider "aws" {
    region = "us-east-1"
  
}

module "ec2_inst_module" {
    source = "./module"  
}