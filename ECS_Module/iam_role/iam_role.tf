resource "aws_iam_role" "ecs_task_execution_role_tf" {
  name = "ecsTaskExecutionRoleTF"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

}