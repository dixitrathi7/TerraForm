#vpc_tag = cg

environment = "tf"

project = "cg"

vpc_cidr_range = "11.0.0.0/16"

PublicSubnet_cidr_range = ["11.0.1.0/24"]

PrivateSubnet_cidr_range = ["11.0.40.0/24"]

PublicSubnet_availability_zone = ["us-east-1f"]

PrivateSubnet_availability_zone = ["us-east-1b"]

cg-ami = "ami-012967cc5a8c9f891"

cg-inst-type = "t2.micro"

cg-inst_pem_key = "dixit_test_key"

# bastion host variable

b_inst_type = "t2.micro"

b_inst_ami = "ami-012967cc5a8c9f891"

b_inst_sg = ["sg-0c8ab140e53c98b5f"]

lb-sg-id = "sg-0c8ab140e53c98b5f"

b_inst_pem_key = "dixit_test_key"

public_ports_open = [22, 80, 443]