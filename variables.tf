###
#  projects variable split into four main fields
#    * name (string) - the name of the project as shown in the UI
#    * description (string) - the description of the project as shown in the UI
#    * credential (string) - the name of the credential (AWS Assume Role) assigned to the Project
#    * policy (object) - the project policy settings
###

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
          team = string
          role = string
        })
      ))
      sub_projects = optional(map(
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
              team = string
              role = string
            })
          ))
        })
      ))
    })
  )
  description = "map of object with names, descriptions, credentials and policies"
}