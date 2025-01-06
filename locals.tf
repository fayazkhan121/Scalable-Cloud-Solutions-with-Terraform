locals {
  project_name = "Scalable-Cloud-Solution"
  environment  = "dev"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    Terraform   = "true"
  }
}
