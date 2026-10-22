variable "surname" {
  type = string
}

variable "initial" {
  type = string
}

variable "environment" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.37"
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "availability zone => CIDR, EKS needs at least 2 zones"

  validation {
    condition     = length(var.subnet_cidrs) >= 2
    error_message = "EKS needs subnets in at least 2 availability zones."
  }
}

variable "instance_type" {
  type = string
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
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
  type    = number
  default = 30007
}

variable "nodeport_allowed_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
