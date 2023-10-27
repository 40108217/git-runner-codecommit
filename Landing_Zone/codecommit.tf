resource "aws_codecommit_repository" "veru_repo" {
    repository_name = var.repo_name
    description = "This is my first repo automation"
    default_branch = "master"
  
}