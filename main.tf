module "eks" {
  source = "./modules/capitec_eks"

  surname                = var.surname
  initial                = var.initial
  environment            = var.environment
  kubernetes_version     = var.kubernetes_version
  subnet_cidrs           = var.subnet_cidrs
  instance_type          = var.instance_type
  capacity_type          = var.capacity_type
  node_min_size          = var.node_min_size
  node_max_size          = var.node_max_size
  node_desired_size      = var.node_desired_size
  nodeport               = var.nodeport
  nodeport_allowed_cidrs = var.nodeport_allowed_cidrs
}
