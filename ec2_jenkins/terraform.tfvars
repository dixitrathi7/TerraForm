regioncode = "us-east-1"

#your Security group variable is metion 

vpc_id = "vpc-0020080c036367fbd"

#alb_sg_tag = ""

#jenkins_sg_tag = ""

jenkins_port = 8080

# from here your ec2 instance variable is metion

ec2_count = 1

ec2_ami = "ami-0ae8f15ae66fe8cda"

ec2_instance_type = "t2.micro"

ec2_public_key = "dixit-n-virg"

ec2_tag = "jenkins_ssl"

ec2_subnet_id = "subnet-0506a5dcc24fc704d"

# from here targt group variable is define 

tg_forward_port = 80

tg_register_port = 8080

tg_target_type = "instance"

tg_health_path = "/login"


# from here Application load balancer variable is start 

LB_facing = false

lb_type = "application"

alb_ipa_type = "ipv4"