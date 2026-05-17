
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids = [ var.Pub_subnet_id_1a , var.Pub_subnet_id_1b ]
  }

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = [ var.Pub_subnet_id_1a , var.Pub_subnet_id_1b ]

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = [var.instance_type]

    remote_access {
    ec2_ssh_key                = var.ec2_ssh_key_name
    source_security_group_ids  = [ var.node_group_sg_id ]
  }

  tags = {
    Name = "${var.cluster_name}-node-group"
  }
}
