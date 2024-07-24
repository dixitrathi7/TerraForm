resource "aws_eip" "eip-nat-a" {
    domain   = "vpc"

  tags = {
    Name = "eip_nat"
  }
}

resource "aws_nat_gateway" "nat_gat" {
  allocation_id = aws_eip.eip-nat-a.id
  subnet_id     = var.subnet_id
  tags = {
    Name = "nat gat"
  }
  depends_on = [var.subnet_id]

}

resource "aws_route" "private_RT" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gat.id
}