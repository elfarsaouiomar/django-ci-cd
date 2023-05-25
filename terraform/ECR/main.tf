# Initialize the Terraform configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "public_ecr" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  lifecycle {
    ignore_changes = [image_tag_mutability]
  }
}
