terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Backend settings are passed in at init time, one file per environment:
  #   terraform init -reconfigure -backend-config=envs/dev/dev.tfbackend
  backend "s3" {}
}

provider "aws" {
  region = "af-south-1"

  default_tags {
    tags = local.common_tags
  }
}
