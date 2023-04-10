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