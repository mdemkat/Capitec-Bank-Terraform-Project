# Names look like mdemka-t-eks-dev
locals {
  prefix = "${var.surname}-${var.initial}"

  cluster_name      = "${local.prefix}-eks-${var.environment}"
  cluster_role_name = "${local.prefix}-eks-cluster-role-${var.environment}"
  node_role_name    = "${local.prefix}-eks-node-role-${var.environment}"
  node_group_name   = "${local.prefix}-eks-nodes-${var.environment}"
  subnet_name       = "${local.prefix}-subnet-${var.environment}"
}
