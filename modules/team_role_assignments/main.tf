# data lookup used by both custom roles and named roles
data "env0_team" "this" {
  for_each = local.teams
  name     = each.value.team_name
}

# data lookup only for custom roles
data "env0_custom_role" "this" {
  for_each = local.custom_team_role_assignments
  name     = each.value.custom_role_name
}

resource "env0_team_project_assignment" "custom_roles" {
  for_each = local.custom_team_role_assignments

  team_id        = data.env0_team.this[each.key].id
  project_id     = var.project_id
  custom_role_id = data.env0_custom_role.this[each.key].id
}

resource "env0_team_project_assignment" "roles" {
  for_each = local.team_role_assignments

  team_id    = data.env0_team.this[each.key].id
  project_id = var.project_id
  role       = local.team_role_assignments[each.key].role
}

locals {
  ## trick to make list into a map, so that its more resilient to order changes

  # this map is mainly for the data lookup of team names to id
  teams = (var.team_role_assignments == null) ? {} : {
    for k, v in var.team_role_assignments :
    v.team_name => {
      team_name = v.team_name
    }
  }

  # map of team assignments that use a custom team role
  custom_team_role_assignments = (var.team_role_assignments == null) ? {} : {
    for k, v in var.team_role_assignments :
    v.team_name => {
      custom_role_name = v.custom_role_name
    }
    if v.custom_role_name != null
  }

  # map of team assignments that use a generic role
  team_role_assignments = (var.team_role_assignments == null) ? {} : {
    for k, v in var.team_role_assignments :
    v.team_name => {
      role = v.role
    }
    if v.role != null
  }
}