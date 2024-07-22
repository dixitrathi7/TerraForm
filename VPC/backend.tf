terraform {
  backend "s3" {
    bucket = "s3-bucket-contain-tf-state-file-dixit07"
    key = "Modules/vpcModule.tfstate"
    region = "us-east-1"
    
  }
}