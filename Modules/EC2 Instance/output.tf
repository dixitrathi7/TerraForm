output "public_ip_of_instance" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.tf_inst[*].public_ip
}


output "name_of_instance" {
  description = "Tags of the EC2 instance"
  value       = aws_instance.tf_inst[*].tags.Name
}

output "host_id_of_instance" {
  description = "Host ID of the EC2 instance"
  value       = aws_instance.tf_inst[*].host_id
}


output "ami_of_instance" {
  description = "AMI ID of the EC2 instance"
  value       = aws_instance.tf_inst[*].ami
}
