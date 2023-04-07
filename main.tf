# create the project with the name and description
resource "env0_project" "project" {
  for_each    = var.projects
  name        = each.value.name
  description = each.value.description
  parent_project_id = (each.value.parent_project == null ? null : data.env0_project.parent[each.key].id) 
}

data "env0_project" "parent" {
  for_each = var.projects
  name = (each.value.parent_project == null ? "" : each.value.parent_project)
}

# configure the policy for each project
resource "env0_project_policy" "policy" {
  for_each                      = var.projects
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
}

# using the data resource to get the credential ID
data "env0_aws_credentials" "credentials" {
  for_each = var.projects
  name     = each.value.credential
}

# configure the project with the proper credentials
resource "env0_cloud_credentials_project_assignment" "credential_project" {
  for_each      = var.projects
  project_id    = env0_project.project[each.key].id
  credential_id = data.env0_aws_credentials.credentials[each.key].id
}



