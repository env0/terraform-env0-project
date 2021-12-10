terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "0.0.20"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "env0" {
}

resource "env0_project" "project" {
  for_each    = var.projects
  name        = each.value.name
  description = each.value.description
}

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

variable "projects" {
  type = map(
    object({
      name        = string
      description = string
      policy = object({
        continuous_deployment_default = optional(bool)
        disable_destroy_environments  = bool
        include_cost_estimation       = bool
        number_of_environments        = string
        number_of_environments_total  = string
        requires_approval_default     = bool
        run_pull_request_plan_default = bool
        skip_apply_when_plan_is_empty = bool
        skip_redundant_deployments    = bool
      })
    })
  )

  description = "map of object with names and descriptions e.g. {dev0={name=\"dev\",description=\"this is my dev project\",policy=local.devpolicy}}"
}

# variable "policy" {
#   type = object({
#     continuous_deployment_default = optional(bool)
#     disable_destroy_environments  = bool
#     include_cost_estimation       = bool
#     number_of_environments        = string
#     number_of_environments_total  = string
#     requires_approval_default     = bool
#     run_pull_request_plan_default = bool
#     skip_apply_when_plan_is_empty = bool
#     skip_redundant_deployments    = bool
#   })

#   description = "project policy"

#   default = {
# continuous_deployment_default = true
# disable_destroy_environments  = false
# include_cost_estimation       = true
# number_of_environments        = "3"
# number_of_environments_total  = "10"
# requires_approval_default     = true
# run_pull_request_plan_default = true
# skip_apply_when_plan_is_empty = true
# skip_redundant_deployments    = true
#   }
# }

output "id" {
  value = {
    for k, v in env0_project.project : k => v.id
  }
}