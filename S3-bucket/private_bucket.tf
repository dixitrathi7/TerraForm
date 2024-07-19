provider "aws" {
    region = "us-east-1"

}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "s3-bucket-contain-tf-state-file-dixit07"
  acl    = "private"

  versioning {
    enabled = true
  }
}
