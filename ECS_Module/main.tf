
module "iam_role" {
    source = "./iam_role"

}

module "vpc_module" {
    source = "./vpc_module"
    LB_SG_id = module.sg_module.LB_SG_id
    ecsRegion = var.ecsRegion
}

module "sg_module" {
    source = "./sg_module"
    vpc_id = module.vpc_module.vpc_id    
    ecs_from_port_r1 = var.ecs_from_port_r1
    ecs_to_port_r1 = var.ecs_to_port_r1
}

module "lb_tg_module" {
    source = "./lb_tg_module"
    Pub_subnet_id_1a = module.vpc_module.Pub_subnet_id_1a
    Pub_subnet_id_1b = module.vpc_module.Pub_subnet_id_1b
    LB_SG_id = module.sg_module.LB_SG_id
    vpc_id = module.vpc_module.vpc_id
}

module "ecs_fargate" {
    source = "./ecs_module"
    iam_role_arn = module.iam_role.iam_role_arn
    ECS_SG_id = module.sg_module.ECS_SG_id
    Pub_subnet_id_1a = module.vpc_module.Pub_subnet_id_1a
    Pvt_subnet_id_1a = module.vpc_module.Pvt_subnet_id_1a
    ecs_tg_arn = module.lb_tg_module.ecs_tg_arn

    container_port = var.container_port
    host_port = var.host_port
    define_image = var.define_image
    cluster_name = var.cluster_name
    ecs_service_name = var.ecs_service_name
  
}