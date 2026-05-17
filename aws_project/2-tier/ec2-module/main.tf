resource "aws_instance" "cg_inst" {
 # count           = var.inst_count
  ami             = var.cg-inst_ami
  instance_type   = var.cg-inst_type
  security_groups = aws_security_group.privateSG.id
  key_name        = var.cg-inst_pem_key
  subnet_id       = var.inst_subnet_id
  availability_zone        = var.cg-inst-Az
  #user_data = "${file("userdata.sh")}"

  tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-cg-ec2"
  })
}



resource "aws_instance" "bash_inst" {
 # count           = var.inst_count
  ami             = var.b_inst_ami
  instance_type   = var.b_inst_type
  security_groups = aws_security_group.publicSG.id
  key_name        = var.b_inst_pem_key
  subnet_id       = var.b_inst_subnet_id
  availability_zone        = var.b_inst_Az

  #user_data = "${file("userdata.sh")}"

  tags = merge(local.common_tags, {
    Name        = "${var.environment}-${var.project}-bash-ec2"
  })
  
}