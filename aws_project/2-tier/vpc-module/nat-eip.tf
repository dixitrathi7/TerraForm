resource "aws_eip" "nat_eip" {
  domain   = "vpc"

  tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-eip"
  }) 


}


resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.PublicSubnetweb.*.id 

  tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-nat"
  }) 
  depends_on = [ aws_subnet.PublicSubnetweb ]
}

resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.PvtRouteTable.id  
  destination_cidr_block = "0.0.0.0/0"             
  nat_gateway_id         = aws_nat_gateway.main.id  
}
