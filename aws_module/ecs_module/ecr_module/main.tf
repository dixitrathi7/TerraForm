resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.repo_name

  force_delete = true

  image_scanning_configuration {
    scan_on_push = var.img_scanning
  }

  image_tag_mutability = var.repo_tag_mutability
}

