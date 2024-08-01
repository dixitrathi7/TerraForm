# Define the VPC endpoint for ECR Docker
resource "aws_vpc_endpoint" "ecr_docker" {
  vpc_id            = aws_vpc.myvpc.id
  service_name      = "com.amazonaws.${var.ecsRegion}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  subnet_ids        = [
    aws_subnet.PrivateSubnet_1a.id,
    aws_subnet.PrivateSubnet_1b.id
  ]
  security_group_ids = [var.LB_SG_id]

  private_dns_enabled = true

  tags = {
    Name = "ECR Docker VPC Endpoint"
  }
}

# Define the VPC endpoint for ECR API
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.myvpc.id
  service_name      = "com.amazonaws.${var.ecsRegion}.ecr.api"
  vpc_endpoint_type = "Interface"
  subnet_ids        = [
    aws_subnet.PrivateSubnet_1a.id,
    aws_subnet.PrivateSubnet_1b.id
  ]
  security_group_ids = [var.LB_SG_id]

  private_dns_enabled = true

  tags = {
    Name = "ECR API VPC Endpoint"
  }
}