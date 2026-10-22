output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "subnet_ids" {
  value = { for az, s in aws_subnet.eks : az => s.id }
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --region af-south-1 --name ${aws_eks_cluster.this.name}"
}
