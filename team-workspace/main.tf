module "web" {
    source = "./app_workspace_module"
    team_name = var.team_owner
    app_name = "web"
    use_github = true
}