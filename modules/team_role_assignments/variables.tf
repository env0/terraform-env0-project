variable "team_role_assignments" {
  type = list(
    object({
      team_name        = string
      role             = optional(string)
      custom_role_name = optional(string)
  }))
  description = "mapping of team name to custom role name"
}

variable "project_id" {
  type = string

  description = "project id to assign team to roles"
}

