terraform {
  backend "s3" {
    bucket = "s3-bucket-contain-tf-state-file-dixit07"
    key = "vpctf/terraform.tfstate"
    region = "us-east-1"
    
  }
}

resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "tf_vpc_dixit"
  }
}

resource "aws_subnet" "PublicSubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.Pub_cidr
    tags = {
        Name = "Public-Subnet"
  }
}

resource "aws_subnet" "PrivateSubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.Pvt_cidr
    tags = {
        Name = "Private-Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id

    tags = {
      Name = "tf-igw"
    }
}

resource "aws_route_table" "PubRouteTable" {
    vpc_id = aws_vpc.myvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "Public-RT"
    }
}

resource "aws_route_table_association" "PubRTaccociation" {
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PubRouteTable.id
}

resource "aws_route_table" "PvrtRouteTable" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "Private-RT"
    }
}

resource "aws_route_table_association" "PrvtRTaccociation" {
  subnet_id      = aws_subnet.PrivateSubnet.id
  route_table_id = aws_route_table.PvrtRouteTable.id
}