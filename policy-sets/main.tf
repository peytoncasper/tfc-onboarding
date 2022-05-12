data "tfe_workspace_ids" "all" {
    names        = ["*"]
    organization = var.org_name
}

data "tfe_workspace" "all" {
  name          = each.key
  organization  = var.org_name
  for_each      = data.tfe_workspace_ids.all.full_names
}

data "tfe_oauth_client" "github" {
  oauth_client_id = var.github_oauth_client_id
}


locals {
    tags = distinct(flatten(values(data.tfe_workspace.all).*.tag_names))

    tag_workspaces = {
        for x in local.tags: 
        x => [
            for y in values(data.tfe_workspace.all): y.id if contains(y.tag_names, x)
        ]
    }
}

resource "tfe_policy_set" "onboarding-policies" {
  name          = "onboarding-policies"
  description   = "Contains policies that govern workspace onboarding automation"
  organization  = var.org_name
  policies_path = "sentinel/"
  workspace_ids = concat(local.tag_workspaces["team_a"])

  vcs_repo {
    identifier         = "peytoncasper/tfc-onboarding"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = data.tfe_oauth_client.github.oauth_token_id
  }
}

