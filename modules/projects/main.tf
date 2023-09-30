resource "env0_project" "project" {
  for_each = local.projects

  name              = each.value.name
  description       = each.value.description
  parent_project_id = var.parent_project_id
}

module "team_role_assignments" {
  for_each = local.projects

  source                = "../team_role_assignments"
  project_id            = env0_project.project[each.key].id
  team_role_assignments = each.value.team_role_assignments
}

# using the data resource to get the credential ID
data "env0_aws_credentials" "credentials" {
  for_each = local.credentials
  name     = each.value.credential
}

# configure the project with the proper credentials
resource "env0_cloud_credentials_project_assignment" "credential_project" {
  for_each      = local.credentials
  project_id    = env0_project.project[each.key].id
  credential_id = data.env0_aws_credentials.credentials[each.key].id
}

# configure the policy for each project
resource "env0_project_policy" "policy" {
  for_each                      = local.policies
  project_id                    = env0_project.project[each.key].id
  continuous_deployment_default = each.value.policy.continuous_deployment_default
  disable_destroy_environments  = each.value.policy.disable_destroy_environments
  include_cost_estimation       = each.value.policy.include_cost_estimation
  number_of_environments        = each.value.policy.number_of_environments
  number_of_environments_total  = each.value.policy.number_of_environments_total
  requires_approval_default     = each.value.policy.requires_approval_default
  run_pull_request_plan_default = each.value.policy.run_pull_request_plan_default
  skip_apply_when_plan_is_empty = each.value.policy.skip_apply_when_plan_is_empty
  skip_redundant_deployments    = each.value.policy.skip_redundant_deployments
  default_ttl                   = each.value.policy.default_ttl
  max_ttl                       = each.value.policy.max_ttl
}

locals {
  projects = (var.projects == null) ? {} : var.projects
  credentials = {
    for k, v in local.projects : k => {
      credential = v.credential
    }
    if v.credential != null
  }
  policies = {
    for k, v in local.projects : k => {
      policy = v.policy
    }
    if v.policy != null
  }
}


