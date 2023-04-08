output "projects" {
  value = {
    for k, v in env0_project.project : k => {
      name         = v.name
      id           = v.id
      sub_projects = module.sub_project[k].projects
    }
  }
}