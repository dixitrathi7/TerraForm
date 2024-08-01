output "ecs_tg_arn" {
    value = aws_lb_target_group.ecs_tg.arn
}

output "ecs_lb_arn" {
    value = aws_lb.ecs_lb.arn
}