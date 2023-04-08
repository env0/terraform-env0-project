# output "projects" {
#   value = {
#     for k, v in module.project.projects : k => {
#       name         = v.name
#       id           = v.id
#       sub_projects = module.sub_project[k].projects
#     }
#   }
# }

output "projects" {
  value = module.project.projects
}

output "sub_projects" {
  value = {
    for k,v in var.projects : k => module.sub_project[k].projects
  }
}