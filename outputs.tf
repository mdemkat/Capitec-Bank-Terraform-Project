output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "subnet_ids" {
  value = module.eks.subnet_ids
}

output "kubeconfig_command" {
  description = "Run this after apply to connect kubectl"
  value       = module.eks.kubeconfig_command
}
