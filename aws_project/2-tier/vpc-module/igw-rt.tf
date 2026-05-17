
resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-igw"
  })  
    depends_on = [ aws_vpc.myvpc ]
}

resource "aws_route_table" "PubRouteTable" {
    vpc_id = aws_vpc.myvpc.id
    
    route {
        cidr_block = var.pub_rt_route
        gateway_id = aws_internet_gateway.myigw.id
    }
    tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-public-rt"
  })
    depends_on = [ aws_subnet.PublicSubnetweb ]
}

resource "aws_route_table_association" "Pubrtaccociation" {
    count = length(var.PublicSubnet_cidr_range)
    subnet_id = element(aws_subnet.PublicSubnetweb.*.id, count.index)
    route_table_id = aws_route_table.PubRouteTable.id
}

resource "aws_route_table" "PvtRouteTable" {
    vpc_id = aws_vpc.myvpc.id
    
    tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-private-rt"
  })
    depends_on = [ aws_subnet.PrivateSubnetapp ]
}

resource "aws_route_table_association" "Pvtrtaccociation" {
    count = length(var.PrivateSubnet_cidr_range)
    subnet_id = element(aws_subnet.PrivateSubnetapp.*.id, count.index)
    route_table_id = aws_route_table.PvtRouteTable.id
}
