output "aws_vpc_cidr_range_is" {
  description = "Your VPC has the following CIDR range"
  value       = aws_vpc.myvpc.cidr_block
}

output "aws_vpc_public_subnet_cidr_range_is" {
  description = "The CIDR range for the public subnet"
  value       = aws_subnet.PublicSubnetweb.*.id
}

output "aws_vpc_private_subnet_cidr_range_is" {
  description = "The CIDR range for the private subnet"
  value       = aws_subnet.PrivateSubnetapp.*.id
}
output "vpc_id" {
    description = "it is the ID of this VPC"
    value = aws_vpc.myvpc.id
}

output "public_subnet_id" {
    value = aws_subnet.PublicSubnetweb.*.id
}

output "private_subnet_id" {
    value = aws_subnet.PrivateSubnetapp.*.id
}

output "igw_id" {
    value = aws_internet_gateway.myigw.id
}

output "Private_rt_id" {
  value = aws_route_table.PvtRouteTable.id
}

output "Public_rt_id" {
  value = aws_route_table.PubRouteTable.id
}

output "PublicSubnet_availability_zone" {
  value = ""
}