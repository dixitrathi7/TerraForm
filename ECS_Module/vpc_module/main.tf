resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr_range
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc_tag
    } 
}

resource "aws_subnet" "PublicSubnetweb_1a" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PublicSubnet_cidr_range_1a
    availability_zone = var.availability_zone_1a
    map_public_ip_on_launch = true

    tags = {
      Name   = var.PublicSubnet_tag
    }
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = var.igw_tag
    }  
}

resource "aws_route_table" "PubRouteTable_1a" {
    vpc_id = aws_vpc.myvpc.id
    
    route {
        cidr_block = var.pub_rt_route
        gateway_id = aws_internet_gateway.myigw.id
    }
    tags = {
        Name = "Public_rt_1a" 
    }
}

resource "aws_route_table_association" "Pubrtaccociation_1a" {
    subnet_id = aws_subnet.PublicSubnetweb_1a.id
    route_table_id = aws_route_table.PubRouteTable_1a.id
}




resource "aws_subnet" "PublicSubnetweb_1b" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PublicSubnet_cidr_range_1b
    availability_zone = var.availability_zone_1b
    map_public_ip_on_launch = true

    tags = {
      Name   = var.PublicSubnet_tag
    }
}


resource "aws_route_table_association" "Pubrtaccociation_1b" {
    subnet_id = aws_subnet.PublicSubnetweb_1b.id
    route_table_id = aws_route_table.PubRouteTable_1a.id
}
// from here define Privte Subnet , Private Route Table

resource "aws_subnet" "PrivateSubnet_1a" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PrivateSubnet_cidr_range_1a
    availability_zone = var.availability_zone_1a
    map_public_ip_on_launch = false
    
    tags = {
      Name   = var.PrivateSubnet_tag_1a
    }
}

resource "aws_route_table" "PvtRouteTable_1a" {
    vpc_id = aws_vpc.myvpc.id
    
    tags = {
        Name = "Private_rt_1a" 
    }
}

resource "aws_route_table_association" "Pvtrtaccociation_1a" {
    subnet_id = aws_subnet.PrivateSubnet_1a.id
    route_table_id = aws_route_table.PvtRouteTable_1a.id
}

resource "aws_subnet" "PrivateSubnet_1b" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PrivateSubnet_cidr_range_1b
    availability_zone = var.availability_zone_1b
    map_public_ip_on_launch = false
    
    tags = {
      Name   = var.PrivateSubnet_tag_1a
    }
}


resource "aws_route_table_association" "Pvtrtaccociation_1b" {
    subnet_id = aws_subnet.PrivateSubnet_1b.id
    route_table_id = aws_route_table.PvtRouteTable_1a.id
}