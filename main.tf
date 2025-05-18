
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source           = "./modules/vpc"
  vpc_cidr         = var.vpc_cidr
  vpc_name         = var.vpc_name
  igw_name         = var.igw_name
  route_table_name = var.route_table_name
  default_route    = var.default_route
}

module "network" {
  source         = "./modules/network"
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id

  subnet1_cidr = var.subnet1_cidr
  subnet1_az   = var.subnet1_az
  subnet1_name = var.subnet1_name

  subnet2_cidr = var.subnet2_cidr
  subnet2_az   = var.subnet2_az
  subnet2_name = var.subnet2_name

  sg_name          = var.sg_name
  sg_description   = var.sg_description
  http_description = var.http_description
  allow_http_cidr  = var.allow_http_cidr
  egress_cidr      = var.egress_cidr
}

module "ec2" {
  source          = "./modules/ec2"
  ami             = var.ec2_ami
  instance_type   = var.instance_type
  ec2_name        = var.ec2_name
  key_pair_name   = var.key_pair_name
  public_key_path = var.public_key_path
  subnet_id       = module.network.subnet1_id
  sg_id           = module.network.sg_id

  iam_role_name         = var.iam_role_name
  ssm_policy_arn        = var.ssm_policy_arn
  instance_profile_name = var.instance_profile_name
}
