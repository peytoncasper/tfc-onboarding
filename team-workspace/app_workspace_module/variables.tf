variable "app_name" {}
variable "team_name" {}
variable "org_name" {}

///
/// Azure Active Directory Input Variables
/// Setting use_ado to true requires all ado variables to be set
///

variable "use_ado" {
    type = bool
    default = false
}
variable "ado_project_name" {
    type = string
    default = ""
}
variable "ado_org_name" {
    type = string
    default = ""
}
variable "ado_oauth_client_id" {
    type = string
}


///
/// Github Input Variables
/// Setting use_github to true requires all github variables to be set
///

variable "use_github" {
    type = bool
    default = false
}
variable "github_org_name" {
    type = string
    default = ""
}
variable "github_oauth_client_id" {
    type = string
}
