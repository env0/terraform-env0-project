resource "env0_project" "project" {
  for_each = var.projects

  name              = each.value.name
  description       = each.value.description
  parent_project_id = var.parent_project_id
}

module "team_role_assignments" {
  for_each = var.projects

  source                = "../team_role_assignments"
  project_id            = env0_project.project[each.key].id
  team_role_assignments = each.value.team_role_assignments
}