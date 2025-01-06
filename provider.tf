provider "aws" {
  region = var.aws_region
  # Or you can set AWS credentials via env vars: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, etc.
}
