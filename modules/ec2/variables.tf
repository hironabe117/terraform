# variables.tf

# outputs from the terrafrom.tfvars Common for all modules
variable "owner_name" { type = string }

# outputs from the terrafrom.tfvars EC2
variable "ami" { type = string }
variable "instance_type" { type = string }
variable "ec2_name" { type = string }
variable "key_pair_name" { type = string }
variable "public_key_path" { type = string }

# outputs from the terrafrom.tfvars IAM for EC2
variable "iam_role_name" { type = string }
variable "ssm_policy_arn" { type = string }
variable "instance_profile_name" { type = string }

# outputs from the network module
variable "subnet_public1_id" { type = string }
variable "sg_id" { type = string }