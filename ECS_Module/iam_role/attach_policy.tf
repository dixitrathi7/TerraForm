resource "aws_iam_role_policy_attachment" "ecs_combined_policy_attachment" {
  role       = aws_iam_role.ecs_task_execution_role_tf.name
  policy_arn = aws_iam_policy.ecs_combined_policy_tf.arn
}