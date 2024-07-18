provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "tf_inst" {
  count           = var.inst_count
  ami             = var.inst_ami
  instance_type   = var.inst_type
  security_groups = ["Dixit-SG"]
  key_name        = var.inst_pem_key
  user_data = "${file("userdata.sh")}"

  tags = {
    Name = "TF-${count.index + 1}"
  }
}
