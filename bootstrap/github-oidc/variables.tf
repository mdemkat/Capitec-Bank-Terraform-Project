variable "github_org" {
  description = "GitHub organisation or username that owns the repo, e.g. \"Geeks4LearningJHB\""
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name (no org prefix), e.g. \"CapitecTerraformInfra\""
  type        = string
}
