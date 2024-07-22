terraform {
  backend "s3" {
    bucket = "s3-bucket-contain-tf-state-file-dixit07"
    key = "Modules/ec2Module.tfstate"
    region = "us-east-1"
    
  }
}