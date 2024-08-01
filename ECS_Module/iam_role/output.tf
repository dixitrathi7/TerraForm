output "iam_role_arn" {
    description = "use this output to get iam role arn and provide to the ecs task def"
    value = aws_iam_role.ecs_task_execution_role_tf.arn
}