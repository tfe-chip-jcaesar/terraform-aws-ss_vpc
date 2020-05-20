output "vpc_id" {
  value = aws_vpc.main.id
}

output "cidr" {
  value = var.cidr
}

output "route_tables" {
  value = [aws_route_table.pub_rt.id, aws_route_table.priv_rt.id]
}

output "subnets" {
  value = {
    "public"  = aws_subnet.public
    "private" = aws_subnet.private
    "db"      = aws_subnet.db
  }
}

output "subnet_ids" {
  value = {
    "public"  = [for az in aws_subnet.public : az.id]
    "private" = [for az in aws_subnet.private : az.id]
    "db"      = [for az in aws_subnet.db : az.id]
  }
}

