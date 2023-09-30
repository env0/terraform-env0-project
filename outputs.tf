output "projects" {
  value = {
    for k, v in var.projects :
    k => {
      project      = module.project.projects[k]
      sub_projects = module.sub_project[k].projects
    }
  }
}