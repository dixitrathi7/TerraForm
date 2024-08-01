resource "aws_iam_policy" "ecs_combined_policy_tf" {
  name        = "ECSCombinedPolicyTF"
  description = "Policy granting full access to ECR, ECS, and CloudWatch"
  policy = "${file("iam-policy.json")}"
}


