# variables.tf

# outputs from the terrafrom.tfvars Common for all modules
variable "owner_name" { type = string }

# outputs from the terrafrom.tfvars Network - Subnets
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

# outputs from the terrafrom.tfvars Network - Security Group
variable "sg_name" { type = string }
variable "sg_description" { type = string }
variable "http_description" { type = string }
variable "allow_http_cidr" { type = string }
variable "egress_cidr" { type = string }

# outputs from the terrafrom.tfvars Network - NAT Gateway
variable "natgw_name" { type = string }
variable "natgw_eip_name" { type = string }

# outputs from the terrafrom.tfvars Network - Route Table
variable "route_table_private_name" { type = string }

# outputs from the vpc module
variable "vpc_id" { type = string }
variable "route_table_public_id" { type = string }