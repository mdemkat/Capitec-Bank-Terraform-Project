locals {
  common_tags = {
    APP         = "capitec-terraform-training"
    OWNER       = "Geeks4Learning"
    AUTHOR      = "Thembinkosi Mdemka"
    ENVIRONMENT = var.environment
    MANAGED_BY  = "terraform"
  }
}
