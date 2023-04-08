output "projects" {
  value = {
    for k, v in env0_project.project : k => {
      name = v.name
      id   = v.id
    }
  }
}