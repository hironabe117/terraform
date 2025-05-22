output "subnet1_id" {
  value = aws_subnet.public1.id
}

output "sg_id" {
  value = aws_security_group.http.id
}

output "private_subnet1_id" {
  value = aws_subnet.private1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private2.id
}
