# ------jenkins Iam role, Jenkins Policy and Jenkins role ----- #

resource "aws_iam_role" "jenkins_server_role" {
  name               = "${var.project}-${var.environment}-jenkins-role"
  assume_role_policy = "${file("modules/jenkins/assumerolepolicy.json")}"
  tags               = merge(local.common_tags, {
  Name               = "${var.project}-${var.environment}-jenkins-role"
  })
}

resource "aws_iam_policy" "policy" {
  name        = "${var.project}-${var.environment}-jenkins-policy"
  description = "A jenkins server policy"
  policy      = "${file("modules/jenkins/jenkinspolicy.json")}"
  tags        = merge(local.common_tags, {
  Name        = "${var.project}-${var.environment}-jenkins-policy"
  })
}


resource "aws_iam_policy_attachment" "jenkins_profile-attach" {
  name       = "jenkins_profile-attachment"
  roles      = ["${aws_iam_role.jenkins_server_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name  = "${var.project}-${var.environment}-jenkins-automation-profiles"
  role  = "${aws_iam_role.jenkins_server_role.name}"
  tags  = merge(local.common_tags, {
  Name        = "${var.project}-${var.environment}-jenkins-automation-profiles"
  })
}