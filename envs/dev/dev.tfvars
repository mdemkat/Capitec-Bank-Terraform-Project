environment = "dev"
surname     = "mdemka"
initial     = "t"

# Subnets allocated to us (reserved block 172.31.152.0/22)
subnet_cidrs = {
  "af-south-1a" = "172.31.152.0/24"
  "af-south-1b" = "172.31.153.0/24"
  "af-south-1c" = "172.31.154.0/24"
}

instance_type     = "t3.medium"
capacity_type     = "ON_DEMAND"
node_min_size     = 1
node_max_size     = 2
node_desired_size = 1

nodeport               = 30007
nodeport_allowed_cidrs = ["0.0.0.0/0"]
