module "web" {
    source  = "app.terraform.io/tfc4b-peyton/app-onboarding-module/tfe"
    version = "1.0.2"
    # source = "./app_workspace_module"
    team_name = var.team_owner
    app_name = "web"
    use_github = true
    org_name = var.org_name

    github_oauth_client_id = var.github_oauth_client_id
    ado_oauth_client_id = var.ado_oauth_client_id
}