module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  region            = var.aws_region
  tags              = local.common_tags
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids= module.vpc.private_subnet_ids
  instance_type     = var.instance_type
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  tags              = local.common_tags
}

module "rds" {
  source            = "./modules/rds"
  vpc_id            = module.vpc.vpc_id
  private_subnet_ids= module.vpc.private_subnet_ids
  db_username       = var.db_username
  db_password       = var.db_password
  tags              = local.common_tags
}
