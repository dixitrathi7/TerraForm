output "jenkins_id" {
  value = "${aws_instance.jenkins_server.id}"
}

output "jenkins_sg_id" {
  value = ["${aws_security_group.jenkins-sg.id}"]
}
