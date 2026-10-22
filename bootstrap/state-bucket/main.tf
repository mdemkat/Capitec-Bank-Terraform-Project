# Run once, by hand, before the main project. It creates the S3 bucket that
# holds the dev state. It uses local state because the bucket cannot store
# its own state before it exists.
#
#   cd bootstrap/state-bucket
#   terraform init
#   terraform apply

terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "af-south-1"
}

module "state_bucket" {
  source = "../../modules/capitec_s3"

  prefix            = "mdemka-t"
  environment       = "dev"
  enable_versioning = true
}
