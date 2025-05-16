
output "subnet1_id" {
  value = aws_subnet.public1.id
}

output "subnet2_id" {
  value = aws_subnet.public2.id
}

output "sg_id" {
  value = aws_security_group.http.id
}
