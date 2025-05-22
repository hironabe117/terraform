# output.tf
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet1_id" {
  value = module.network.subnet1_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}
