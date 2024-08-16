output "jenkins_ec2_sg_output" {
    value = aws_security_group.jenkins_SG.id
}

output "alb_sg_output" {
    value = aws_security_group.ALB_SG_jenkins.id
}