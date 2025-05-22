
aws_region               = "ap-northeast-1"
vpc_cidr                 = "10.117.0.0/16"
vpc_name                 = "arsenior-vpc"
igw_name                 = "arsenior-igw"
route_table_public_name  = "arsenior-public-rt"
route_table_private_name = "arsenior-private-rt"
default_route            = "0.0.0.0/0"

public_subnet1_cidr = "10.117.1.0/24"
public_subnet1_az   = "ap-northeast-1a"
public_subnet1_name = "arsenior-public-subnet1"

public_subnet2_cidr = "10.117.2.0/24"
public_subnet2_az   = "ap-northeast-1c"
public_subnet2_name = "arsenior-public-subnet2"

private_subnet1_cidr = "10.117.10.0/24"
private_subnet1_az   = "ap-northeast-1a"
private_subnet1_name = "arsenior-private-subnet1"

private_subnet2_cidr = "10.117.20.0/24"
private_subnet2_az   = "ap-northeast-1c"
private_subnet2_name = "arsenior-private-subnet2"

sg_name          = "allow-http"
sg_description   = "Allow http inbound traffic"
http_description = "HTTP"
allow_http_cidr  = "0.0.0.0/0"
egress_cidr      = "0.0.0.0/0"

natgw_name     = "arsenior-natgw"
natgw_eip_name = "arsenior-natgw-eip"

ec2_ami         = "ami-0b6e7ccaa7b93e898"
instance_type   = "t2.micro"
ec2_name        = "arsenior-EC2-public"
key_pair_name   = "my-key"
public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"

iam_role_name         = "ec2-ssm-role"
ssm_policy_arn        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
instance_profile_name = "ec2-ssm-instance-profile"
