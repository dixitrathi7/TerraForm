resource "aws_ecs_cluster" "my_ecs_ref" {
  name = var.cluster_name

  tags = {
    Name = "my-new-cluster"
  }
} 