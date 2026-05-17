resource "aws_iam_policy" "eks_cluster_role_policy" {

  name        = var.cluster_policy_name
  description = "Policy granting the access to eck cluster mastetr node of access the resources of aws account"
  policy = file("/home/ec2-user/eks_cluster/iam_module/eks-cluster-role-policy.json")
}

resource "aws_iam_policy" "eks_node_role_policy" {

  name        = var.node_policy_name
  description = "Policy granting access to eks _cluster worker node that run by ec2 instance "
  policy = file("/home/ec2-user/eks_cluster/iam_module/eks-node-role-policy.json")
}
