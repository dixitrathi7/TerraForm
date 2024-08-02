provider "aws" {
  region = var.ecsRegion
}

module "ecr_repo" {
  source = "./ecr.tf"
}

resource "null_resource" "build_and_push" {
  provisioner "local-exec" {
    command = <<EOT
    chmod +x ./ecr_module/build_img.sh
    ./ecr_module/build_img.sh ${var.github_repo_url} ${module.ecr_repo.ecr_repository_url}
    EOT
  }
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = module.ecr_repo.ecr_repository_url
}
