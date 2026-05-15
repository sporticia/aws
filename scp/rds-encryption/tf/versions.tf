terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
  default_tags {
    tags = {
      Owner      = "scott"
      CostCenter = "0000"
    }
  }
}
