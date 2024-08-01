output "vpc_id" {
    value = aws_vpc.myvpc.id
}

output "Pub_subnet_id_1a" {
    value = aws_subnet.PublicSubnetweb_1a.id
}

output "Pub_subnet_id_1b" {
    value = aws_subnet.PublicSubnetweb_1b.id
}
output "Pvt_subnet_id_1a" {
    value = aws_subnet.PrivateSubnet_1a.id
}

output "Pvt_subnet_id_1b" {
    value = aws_subnet.PrivateSubnet_1b.id
}
