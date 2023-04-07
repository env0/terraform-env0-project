output "id" {
  value = {
    for k, v in env0_project.project : k => v.id
  }
}
