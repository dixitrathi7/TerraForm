
module "iam_role_module" {
    source = "./iam_module"
    cluster_role_name = var.cluster_role_name
    node_role_name = var.node_role_name
    
}

module "vpc_module" {
    source = "./vpc_module"
 
}

module "eks_module" {
    source = "./eks_module"
    cluster_name = var.cluster_name
    vpc_id = module.vpc_module.vpc_id
    eks_cluster_role_arn = module.iam_role_module.eks_cluster_role_arn
    eks_node_role_arn = module.iam_role_module.eks_node_role_arn
    node_group_sg_id = module.vpc_module.node_group_sg_id
    Pub_subnet_id_1a = module.vpc_module.Pub_subnet_id_1a
    Pub_subnet_id_1b = module.vpc_module.Pub_subnet_id_1b
    Pvt_subnet_id_1a = module.vpc_module.Pvt_subnet_id_1a
    Pvt_subnet_id_1b = module.vpc_module.Pvt_subnet_id_1b

    
}
