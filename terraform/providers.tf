# Configures the AWS provider with the specified region
provider "aws" {
  region = "us-east-1"
}

# Specifies the required providers and their versions for Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
