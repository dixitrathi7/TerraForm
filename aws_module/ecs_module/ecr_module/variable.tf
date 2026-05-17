variable "repo_name" {
  description = "The name of the ECR repository."
  type        = string
  default     = "my-default-repo-name"
}

variable "img_scanning" {
  description = "Ensures that each image is scanned for vulnerabilities automatically when pushed to the ECR repository."
  type        = bool
  default     = true  
}

variable "repo_tag_mutability" {
  description = "The tag mutability setting for the ECR repository."
  type        = string
  default     = "MUTABLE"
}
