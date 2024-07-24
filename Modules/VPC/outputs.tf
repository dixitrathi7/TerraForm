output "aws_vpc_cidr_range_is" {
  description = "Your VPC has the following CIDR range"
  value       = aws_vpc.myvpc.cidr_block
}

output "aws_vpc_public_subnet_cidr_range_is" {
  description = "The CIDR range for the public subnet"
  value       = aws_subnet.PublicSubnetweb.cidr_block
}

output "aws_vpc_private_subnet_cidr_range_is" {
  description = "The CIDR range for the private subnet"
  value       = aws_subnet.PrivateSubnetapp.cidr_block
}

output "aws_vpc_public_route_table_routes" {
  description = "The CIDR blocks for the routes in the public route table"
  value       = [for route in aws_route_table.PubRouteTable.route: route.cidr_block]
}

output "aws_vpc_private_route_table_routes" {
  description = "The CIDR blocks for the routes in the private route table"
  value       = [for route in aws_route_table.PvtRouteTable.route: route.cidr_block]
}

output "vpc_id" {
    description = "it is the ID of this VPC"
    value = aws_vpc.myvpc.id
}

output "public_subnet_id" {
    value = aws_subnet.PublicSubnetweb.id
}

output "private_subnet_id" {
    value = aws_subnet.PrivateSubnetapp.id
}

output "igw_id" {
    value = aws_internet_gateway.myigw.id
}

output "Private_route_table_id" {
  value = aws_route_table.PvtRouteTable.id
}
