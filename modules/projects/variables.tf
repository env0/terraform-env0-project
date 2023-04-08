variable "projects" {
  type = map(
    object({
      name        = string
      description = optional(string)
      credential  = optional(string)
      policy = optional(object({
        continuous_deployment_default = optional(bool)
        disable_destroy_environments  = optional(bool)
        include_cost_estimation       = optional(bool)
        number_of_environments        = optional(string)
        number_of_environments_total  = optional(string)
        requires_approval_default     = optional(bool)
        run_pull_request_plan_default = optional(bool)
        skip_apply_when_plan_is_empty = optional(bool)
        skip_redundant_deployments    = optional(bool)
      }))
      team_role_assignments = optional(map(
        object({
          team_name        = string
          custom_role_name = string
        })
      ))
    })
  )
}

variable "parent_project_id" {
  type        = string
  description = "Id of parent project"
  default     = null
}