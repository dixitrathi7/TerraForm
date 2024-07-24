terraform {
  backend "s3" {
    bucket = "s3-bucket-contain-tf-state-file-dixit07"
    key = "aws_arch/twotier.tfstate"
    region = "us-east-1"
    dynamodb_table = "terra-state-looking-dixit"
  }
}