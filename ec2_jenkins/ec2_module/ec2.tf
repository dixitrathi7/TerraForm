resource "aws_instance" "jenkins_server" {
  #count           = var.ec2_count
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  security_groups = [aws_security_group.jenkins_SG.id]
  key_name        = var.ec2_public_key
  user_data       = var.user_data

  vpc_security_group_ids = [aws_security_group.jenkins_SG.id]

  subnet_id             = var.ec2_subnet_id
  

  tags = {
    Name = var.ec2_tag
  }

  depends_on = [ aws_security_group.jenkins_SG ]
}