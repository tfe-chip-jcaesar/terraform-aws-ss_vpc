output "vpc_id" {
  value = aws_vpc.main.id
}

output "peer_data" {
  value = {
    "vpc_id" = aws_vpc.main.id,
    "region" = data.aws_region.current.name
  }
}

output "peer_list" {
  value = aws_vpc_peering_connection.peer
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

