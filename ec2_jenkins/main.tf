provider "aws" {
    region = var.regioncode
  
}

module "launch-jenkins" {
    source = "./ec2_module"

    vpc_id = var.vpc_id
    ec2_subnet_id = var.ec2_subnet_id
    
    ec2_public_key = var.ec2_public_key
    ec2_ami = var.ec2_ami
    ec2_instance_type = var.ec2_instance_type
    ec2_tag = var.ec2_tag
    
    ec2_count = var.ec2_count
    jenkins_port = var.jenkins_port
    
    tg_forward_port = var.tg_forward_port
    tg_health_path = var.tg_health_path
    tg_register_port = var.tg_register_port

    user_data = file("${path.module}/ec2_module/userdata.sh")

    LB_facing = var.LB_facing
    lb_type = var.lb_type
    alb_ipa_type = var.alb_ipa_type

}