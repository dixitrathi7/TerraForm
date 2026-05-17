output "eks_cluster_role_arn" {
    description = "use this output to get iam role arn and provide to the eks cluster "
    value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
    description = "use this output to get iam role arn and provide to the eks cluster role for node group"
    value = aws_iam_role.eks_node_role.arn
}
