# outputs.tf
output "subnet_public1_id" {
  value = aws_subnet.public1.id
}

output "sg_id" {
  value = aws_security_group.http.id
}