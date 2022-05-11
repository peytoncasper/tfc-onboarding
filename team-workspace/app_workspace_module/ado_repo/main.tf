terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

data "azuredevops_project" "team" {
  name = var.project_name
}

resource "azuredevops_git_repository" "team" {
  project_id = data.azuredevops_project.team.id
  name       = "${var.team_name}-workspace-config"
  initialization {
    init_type = "Clean"
  }
}

