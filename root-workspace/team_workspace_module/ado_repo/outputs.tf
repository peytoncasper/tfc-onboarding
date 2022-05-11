output "repo_identifier" {
    value = "${var.org_name}/${data.azuredevops_project.team.name}/_git/${azuredevops_git_repository.team.name}"
}