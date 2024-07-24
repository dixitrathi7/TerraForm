resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr_range
    tags = {
        Name = var.vpc_tag
    } 
}

resource "aws_subnet" "PublicSubnetweb" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PublicSubnet_cidr_range
    availability_zone = var.PublicSubnet_availability_zone
    map_public_ip_on_launch = true

    tags = {
      Name   = var.PublicSubnet_tag
    }
}

resource "aws_subnet" "PrivateSubnetapp" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PrivateSubnet_cidr_range
    availability_zone = var.PrivateSubnet_availability_zone
    map_public_ip_on_launch = false
    
    tags = {
      Name   = var.PrivateSubnet_tag
    }
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = var.igw_tag
    }  
}

resource "aws_route_table" "PubRouteTable" {
    vpc_id = aws_vpc.myvpc.id
    
    route {
        cidr_block = var.pub_rt_route
        gateway_id = aws_internet_gateway.myigw.id
    }
    tags = {
        Name = "Public_rt" 
    }
}

resource "aws_route_table_association" "Pubrtaccociation" {
    subnet_id = aws_subnet.PublicSubnetweb.id
    route_table_id = aws_route_table.PubRouteTable.id
}

resource "aws_route_table" "PvtRouteTable" {
    vpc_id = aws_vpc.myvpc.id
    
    tags = {
        Name = "Private_rt" 
    }
}

resource "aws_route_table_association" "Pvtrtaccociation" {
    subnet_id = aws_subnet.PrivateSubnetapp.id
    route_table_id = aws_route_table.PvtRouteTable.id
}



















