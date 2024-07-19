terraform {
  backend "s3" {
    bucket = "s3-bucket-contain-tf-state-file-dixit07"
    key = "key/terraform.tfstate"
    region = "us-east-1"
    
  }
}


provider "aws" {
  region     = var.region
}

resource "aws_instance" "tf_inst" {
  count           = var.inst_count
  ami             = var.inst_ami
  instance_type   = var.inst_type
  security_groups = var.inst_security_group
  key_name        = var.inst_pem_key
  user_data = "${file("userdata.sh")}"

  tags = {
    Name = "TF-inst-${count.index + 1}"
  }
}
