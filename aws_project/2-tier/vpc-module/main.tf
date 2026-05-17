resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr_range
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-vpc"
  }) 
}

resource "aws_subnet" "PublicSubnetweb" {
    vpc_id = aws_vpc.myvpc.id
    count = length(var.PublicSubnet_cidr_range)
    cidr_block = element(var.PublicSubnet_cidr_range, count.index)
    availability_zone = element(var.PublicSubnet_availability_zone, count.index)
    map_public_ip_on_launch = true

    tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-public-subnet-${count.index + 1}"
  }) 
    depends_on = [ aws_vpc.myvpc ]
}

resource "aws_subnet" "PrivateSubnetapp" {
    vpc_id = aws_vpc.myvpc.id
    count = length(var.PrivateSubnet_cidr_range)
    cidr_block = element(var.PrivateSubnet_cidr_range, count.index)
    availability_zone = element(var.PrivateSubnet_availability_zone, count.index)
    map_public_ip_on_launch = false
    
    tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-private-subnet-${count.index + 1}"
  }) 
    depends_on = [ aws_vpc.myvpc ]
}