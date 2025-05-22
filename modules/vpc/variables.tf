# variables.tf

# outputs from the terrafrom.tfvars Common for all modules
variable "owner_name" { type = string }

# outputs from the terrafrom.tfvars VPC
variable "vpc_cidr" { type = string }
variable "vpc_name" { type = string }
variable "igw_name" { type = string }
variable "route_table_public_name" { type = string }
variable "default_route" { type = string }
