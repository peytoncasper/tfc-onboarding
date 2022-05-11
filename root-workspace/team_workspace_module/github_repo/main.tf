terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

resource "github_repository" "team" {
  name        = "${var.team_name}-workspace-config"
  visibility = "public"
  auto_init = true
}
