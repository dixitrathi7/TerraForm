resource "aws_instance" "tf_inst" {
  count           = var.inst_count
  ami             = var.inst_ami
  instance_type   = var.inst_type
  security_groups = var.inst_security_group
  key_name        = var.inst_pem_key
  subnet_id       = var.inst_subnet_id
  availability_zone        = var.inst_availability_zone
  user_data = "${file("userdata.sh")}"
  

  tags = {
    Name = "TF-inst-${count.index + 1}"
  }
}