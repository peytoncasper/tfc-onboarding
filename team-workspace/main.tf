module "web" {
    source  = "app.terraform.io/tfc4b-peyton/app-onboarding-module/tfe"
    version = "1.0.3"
    # source = "./app_workspace_module"
    team_name = var.team_owner
    app_name = "web"
    use_github = true
    org_name = var.org_name
    github_org_name = var.github_org_name

    github_oauth_client_id = var.github_oauth_client_id
}