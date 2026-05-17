project               = "AutomationTesting"
environment           = "stage"
region                = "us-east-1"
availability_zones    = ["us-east-1a", "us-east-1b","us-east-1c"]
vpc_cidr              = "10.60.0.0/16"
public_subnets_cidr   = ["10.60.0.0/20", "10.60.16.0/20","10.60.32.0/20"] //List of Public subnet cidr range
private_subnets_cidr  = ["10.60.48.0/20", "10.60.80.0/20","10.60.96.0/20"] //List of app private subnet cidr range
dynamodb_table_name   = "zinrelo-terraform-state-lock"
