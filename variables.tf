
variable "aws_region" {}

# VPC
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "igw_name" {}
variable "route_table_name" {}
variable "default_route" {}

# Subnets
variable "subnet1_cidr" {}
variable "subnet1_az" {}
variable "subnet1_name" {}

variable "subnet2_cidr" {}
variable "subnet2_az" {}
variable "subnet2_name" {}

# Security Group
variable "sg_name" {}
variable "sg_description" {}
variable "http_description" {}
variable "allow_http_cidr" {}
variable "egress_cidr" {}

# EC2
variable "ec2_ami" {}
variable "instance_type" {}
variable "ec2_name" {}
variable "key_pair_name" {}
variable "public_key_path" {}

# IAM for EC2
variable "iam_role_name" {}
variable "ssm_policy_arn" {}
variable "instance_profile_name" {}
