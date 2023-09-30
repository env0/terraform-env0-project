output "projects" {
  value = {
    for k, v in env0_project.project : k => {
      name                 = v.name
      id                   = v.id
      team_role_assignment = module.team_role_assignments[k]
    }
  }
}
