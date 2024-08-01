output "LB_SG_id" {
    value = aws_security_group.LB_SG.id
}

output "ECS_SG_id" {
    value = aws_security_group.ECS_SG.id
}

