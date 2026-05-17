# Terraform backend for remote state
terraform {
  backend "s3" {
    encrypt                 = true
    bucket                  = "zinrelo-terraform-automation-statefiles"
    dynamodb_table          = "zinrelo-terraform-automation-state-lock"
    region                  = "us-east-1"
    key                     = "tf-workspace/jenkins.tfstate"
  }
}
