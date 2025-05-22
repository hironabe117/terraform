
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = var.vpc_cidr
  vpc_name                = var.vpc_name
  igw_name                = var.igw_name
  route_table_public_name = var.route_table_public_name
  default_route           = var.default_route
}

module "network" {
  source                   = "./modules/network"
  vpc_id                   = module.vpc.vpc_id
  route_table_public_id    = module.vpc.route_table_public_id
  route_table_private_name = var.route_table_private_name

  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet1_az   = var.public_subnet1_az
  public_subnet1_name = var.public_subnet1_name

  public_subnet2_cidr = var.public_subnet2_cidr
  public_subnet2_az   = var.public_subnet2_az
  public_subnet2_name = var.public_subnet2_name

  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet1_az   = var.private_subnet1_az
  private_subnet1_name = var.private_subnet1_name

  private_subnet2_cidr = var.private_subnet2_cidr
  private_subnet2_az   = var.private_subnet2_az
  private_subnet2_name = var.private_subnet2_name

  sg_name          = var.sg_name
  sg_description   = var.sg_description
  http_description = var.http_description
  allow_http_cidr  = var.allow_http_cidr
  egress_cidr      = var.egress_cidr
  natgw_name       = var.natgw_name
  natgw_eip_name   = var.natgw_eip_name
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

module "s3" {
  source          = "./modules/s3"
  s3_bucket1_name = var.s3_bucket1_name
  owner_name      = var.owner_name
}