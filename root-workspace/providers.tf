terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}
