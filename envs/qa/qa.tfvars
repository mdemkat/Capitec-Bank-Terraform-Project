environment = "qa"
surname     = "mdemka"
initial     = "t"

# Reference only, not deployed. These CIDRs are placeholders: our allocated
# block (172.31.152.0/22) is used by dev, so qa would need its own block.
subnet_cidrs = {
  "af-south-1a" = "172.31.156.0/24"
  "af-south-1b" = "172.31.157.0/24"
  "af-south-1c" = "172.31.158.0/24"
}

instance_type     = "t3.medium"
capacity_type     = "ON_DEMAND"
node_min_size     = 1
node_max_size     = 3
node_desired_size = 1

nodeport               = 30007
nodeport_allowed_cidrs = ["0.0.0.0/0"]
