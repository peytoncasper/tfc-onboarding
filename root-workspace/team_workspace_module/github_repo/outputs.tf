output "repo_identifier" {
    value = "${var.org_name}/${github_repository.team.name}"
}