# variables.tf
variable "aws_region" { type = string }

# Common for all modules
variable "owner_name" { type = string }

# VPC
variable "vpc_cidr" { type = string }
variable "vpc_name" { type = string }
variable "igw_name" { type = string }
variable "route_table_public_name" { type = string }
variable "default_route" { type = string }

# Network - Subnets
variable "public_subnet1_cidr" { type = string }
variable "public_subnet2_cidr" { type = string }
variable "private_subnet1_cidr" { type = string }
variable "private_subnet2_cidr" { type = string }
variable "public_subnet1_az" { type = string }
variable "public_subnet2_az" { type = string }
variable "private_subnet1_az" { type = string }
variable "private_subnet2_az" { type = string }
variable "public_subnet1_name" { type = string }
variable "public_subnet2_name" { type = string }
variable "private_subnet1_name" { type = string }
variable "private_subnet2_name" { type = string }

# Network - Security Group
variable "sg_name" { type = string }
variable "sg_description" { type = string }
variable "http_description" { type = string }
variable "allow_http_cidr" { type = string }
variable "egress_cidr" { type = string }

# Network - NAT Gateway
variable "natgw_name" { type = string }
variable "natgw_eip_name" { type = string }

# Network - Route Table
variable "route_table_private_name" { type = string }

# EC2
variable "ec2_ami" { type = string }
variable "instance_type" { type = string }
variable "ec2_name" { type = string }
variable "key_pair_name" { type = string }
variable "public_key_path" { type = string }

# IAM for EC2
variable "iam_role_name" { type = string }
variable "ssm_policy_arn" { type = string }
variable "instance_profile_name" { type = string }

# S3
variable "s3_bucket1_name" { type = string }