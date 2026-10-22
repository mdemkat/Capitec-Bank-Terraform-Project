variable "surname" {
  type        = string
  description = "Surname in lowercase, e.g. mdemka"
}

variable "initial" {
  type        = string
  description = "First initial in lowercase, e.g. t"
}

variable "environment" {
  type        = string
  description = "dev, qa or prod"

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "environment must be dev, qa or prod."
  }
}

variable "kubernetes_version" {
  type        = string
  description = "EKS Kubernetes version"
  default     = "1.37"
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "Subnets to create in the default VPC, as availability zone => CIDR"
}

variable "instance_type" {
  type        = string
  description = "Worker node instance type"
}

variable "capacity_type" {
  type        = string
  description = "ON_DEMAND or SPOT"
  default     = "ON_DEMAND"
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_desired_size" {
  type    = number
  default = 1
}

variable "nodeport" {
  type        = number
  description = "NodePort opened for the nginx service (30000-32767)"
  default     = 30007
}

variable "nodeport_allowed_cidrs" {
  type        = list(string)
  description = "Who can reach the NodePort"
  default     = ["0.0.0.0/0"]
}
