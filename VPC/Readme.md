# VPC Terraform Script 

This script is create the VPC component like

1. VPC
2. Subnet
3. Internet Gateway
4. Route Table

After Route Table is create then it automatically attach to the subnet
- Every Route Table have there own rule 
#### Similarly IGW is automatically attach to the VPC 
## And use S3 Bucket to store terraform .tfstate file 
