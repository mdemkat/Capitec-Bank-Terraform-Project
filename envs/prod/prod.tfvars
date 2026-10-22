environment = "prod"
surname     = "mdemka"
initial     = "t"

# Reference only, not deployed. Placeholder CIDRs, see qa.tfvars.
subnet_cidrs = {
  "af-south-1a" = "172.31.160.0/24"
  "af-south-1b" = "172.31.161.0/24"
  "af-south-1c" = "172.31.162.0/24"
}

instance_type     = "t3.large"
capacity_type     = "ON_DEMAND"
node_min_size     = 1
node_max_size     = 6
node_desired_size = 1

nodeport               = 30007
nodeport_allowed_cidrs = ["0.0.0.0/0"]
