# jenkins security group 
resource "aws_security_group" "jenkins-sg" {
  name   = "${var.project}-jenkins_sg"
  vpc_id = var.vpc_id

  # HTTP access from VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
   ingress {
    from_port   = 443
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    security_groups = [
              "${aws_security_group.jenkins-alb.id}"
            ]
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = merge(
    {
      Name = "${var.project}-jenkins_sg"
    },
    local.common_tags
  )
}


resource "aws_kms_key" "jenkins-kms-key" {
  description              = "jenkins KMS Key"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
}

resource "aws_instance" "jenkins_server" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "${var.jenkins_instance}"
  subnet_id       = "${var.public_subnets_id[0]}"
  key_name        = "${var.jenkins_key}"
  vpc_security_group_ids = "${[aws_security_group.jenkins-sg.id]}"
  user_data       = "${file("install-jenkins.sh")}"
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_profile.name}"
    # root disk
  # root_block_device {
  #   volume_size           = "50"
  #   volume_type           = "gp3"
  #   encrypted             = true
  #   kms_key_id            = "${aws_kms_key.jenkins-kms-key.key_id}"     
  #   delete_on_termination = true
  # }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "50"
    volume_type           = "gp3"
    encrypted             = true
    kms_key_id            = aws_kms_key.jenkins-kms-key.key_id    
    delete_on_termination = true
  }
  
    tags = merge(local.common_tags, {
    Name        = "${var.project}-${var.environment}-jenkins"
  })
  lifecycle {
        ignore_changes = [security_groups]
   }
}