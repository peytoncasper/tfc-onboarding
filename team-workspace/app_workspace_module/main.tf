data "tfe_oauth_client" "ado" {
  oauth_client_id = "oc-STqC7WV58WqViMvB"
}

data "tfe_oauth_client" "github" {
  oauth_client_id = "oc-6dX3RSYf58r1VB9X"
}

data "tfe_team" "app" {
  name         = var.team_name
  organization = var.org_name
}

module "ado_repo" {
  source = "./ado_repo"
  org_name = var.ado_org_name
  team_name = var.app_name
  project_name = var.ado_project_name
  count = var.use_ado ? 1 : 0
}

module "github_repo" {
  source = "./github_repo"
  org_name = var.github_org_name
  team_name = var.app_name
  count = var.use_github ? 1 : 0
}


locals {
  # If GitHub get the GitHub modules repo_identifier
  # Else If ADO get the ADO modules repo_identifier 
  # Else ""
  vcs_identifier = var.use_github ? module.github_repo.0.repo_identifier : var.use_ado ? module.ado_repo.0.repo_identifier : ""

  # If GitHub get the GitHub OAuth token id
  # Else If ADO get the ADO OAuth token id
  # Else ""
  vcs_token_id = var.use_github ? data.tfe_oauth_client.github.oauth_token_id : var.use_ado ? data.tfe_oauth_client.ado.oauth_token_id : ""
}

resource "tfe_workspace" "app" {
    name         = "${var.app_name}-workspace"
    organization = var.org_name
    tag_names    = [var.team_name]

    vcs_repo {
      identifier = local.vcs_identifier
      oauth_token_id = local.vcs_token_id
    }

    count = local.vcs_identifier != "" && local.vcs_token_id != "" ? 1 : 0
}

resource "tfe_team_access" "app" {
  access       = "write"
  team_id      = data.tfe_team.app.id
  workspace_id = tfe_workspace.app.0.id
}