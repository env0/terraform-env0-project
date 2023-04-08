# create the project with the name and description
# resource "env0_project" "project" {
#   for_each    = var.projects
#   name        = each.value.name
#   description = each.value.description
# }

module "project" {
  source   = "./modules/projects"
  projects = var.projects
}

module "sub_project" {
  for_each = var.projects

  source            = "./modules/projects"
  projects          = each.value.sub_projects
  parent_project_id = module.project.projects[each.key].id
}

# module "team_role_assignments" {
#   for_each = var.projects

#   source                = "./modules/team_role_assignments"
#   project_id            = env0_project.project[each.key].id
#   team_role_assignments = each.value.team_role_assignments
# }



