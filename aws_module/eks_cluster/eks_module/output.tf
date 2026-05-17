output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API server."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority" {
  description = "The CA certificate for your EKS Kubernetes cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_name" {
  description = "The name of your EKS cluster."
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_arn" {
  description = "The ARN for your EKS Kubernetes cluster."
  value       = aws_eks_cluster.eks_cluster.arn
}
