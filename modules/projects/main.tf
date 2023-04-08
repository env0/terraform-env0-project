resource "env0_project" "project" {
  for_each = var.projects

  name              = each.value.name
  description       = each.value.description
  parent_project_id = var.parent_project_id
}