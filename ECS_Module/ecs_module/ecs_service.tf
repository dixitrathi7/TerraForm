resource "aws_ecs_service" "ECS_service_ref" {
  name                               = var.cluster_name
  launch_type                        = var.service_launch_types
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.my_ecs_ref.id  
  task_definition                    = aws_ecs_task_definition.task_def_ref.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = var.desired_no_count
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  // depends_on                         = [aws_alb_listener.Listener, aws_iam_role.iam-role]


  network_configuration {
    subnets          = [ var.Pub_subnet_id_1a ]
    security_groups  = [ var.ECS_SG_id ]
    assign_public_ip = true
    #assign_public_ip = "DISABLED"
  }

  load_balancer {
    target_group_arn = var.ecs_tg_arn
    container_name   = "hotstar"
    container_port   = 3000
  }


}

