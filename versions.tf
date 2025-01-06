terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  # Backend configuration (S3, for example)
  backend "s3" {
    # Move these to backend-config/s3_backend.conf if you want to keep them out of source.
    bucket = "<YOUR_S3_BUCKET_NAME>"
    key    = "terraform-state/my-environment/terraform.tfstate"
    region = "us-east-1"
    # encrypt = true  # Usually good practice to encrypt your TF state
  }
}
