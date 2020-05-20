output "vpc_id" {
  value = aws_vpc.main.id
}

output "cidr" {
  value = var.cidr_block
}

locals {
  pub_rts  = [aws_route_table.pub_rt.id]
  priv_rts = [for rt in aws_route_table.priv_rt : rt.id]
  db_rts   = [for rt in aws_route_table.db_rt : rt.id]
}
output "route_tables" {
  value = concat(local.pub_rts, local.priv_rts, local.db_rts)
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

