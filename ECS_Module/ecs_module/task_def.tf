resource "aws_ecs_task_definition" "task_def_ref" {
  family                   = var.family_name_task_def
  requires_compatibilities = var.launch_types

  network_mode             = var.Task_Networking_mode
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.iam_role_arn

  container_definitions = jsonencode([
    {
      name      = "hotstar"
      image     = var.define_image
      cpu       = var.container_cpu
      memory    = var.container_memory
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]
    }
  ])
}