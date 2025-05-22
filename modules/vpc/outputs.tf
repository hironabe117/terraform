
output "vpc_id" {
  value = aws_vpc.main.id
}

output "route_table_public_id" {
  value = aws_route_table.public.id
}
