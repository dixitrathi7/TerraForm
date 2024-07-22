output "aws_vpc_cidr_range_is" {
    description = "Your VPC have CIDR range is this"
    value = aws_vpc.myvpc.cidr_block
}

output "aws_vpc_public_subnet_cidr_range_is" {
    value = aws_subnet.PublicSubnetweb.cidr_block
}

output "aws_vpc_private_subnet_cidr_range_is" {
    value = aws_subnet.PrivateSubnetapp.cidr_block
}

output "aws_vpc_public_route_table_route" {
    value = aws_route_table.PubRouteTable.route.cidr_block
}

output "aws_vpc_private_route_table_route" {
    value = aws_route_table.PvtRouteTable
}