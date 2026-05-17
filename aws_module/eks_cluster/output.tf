output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster from the eks_module."
  value       = module.eks_module.cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  description = "The CA certificate for the EKS cluster from the eks_module."
  value       = module.eks_module.cluster_certificate_authority
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster from the eks_module."
  value       = module.eks_module.cluster_name
}