provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "devops-end-to-end"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}