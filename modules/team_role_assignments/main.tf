data "env0_team" "this" {
  for_each = local.team_role_assignments
  name     = each.value.team_name
}

data "env0_custom_role" "this" {
  for_each = local.team_role_assignments
  name     = each.value.custom_role_name
}

resource "env0_team_project_assignment" "this" {
  for_each = local.team_role_assignments

  team_id        = data.env0_team.this[each.key].id
  project_id     = var.project_id
  custom_role_id = data.env0_custom_role.this[each.key].id
}

locals {
  ## trick to make list into a map, so that its more resilient to order changes
  team_role_assignments = (var.team_role_assignments == null) ? {} : {
    for k, v in var.team_role_assignments : v.team_name => v
  }
}