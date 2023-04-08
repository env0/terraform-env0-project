[<img src="https://assets-global.website-files.com/5dc3f52851595b160ba99670/6037a6f27d9050ef91b90a86_env0-opengraph%402x.png" alt="env0 Logo" width="300">](https://env0.com)

# Terraform env0 Project Module
Using the env0 TF provider to create an env0 Project (and sub projects) along with configuring the team and role assignments.

See [examples](examples/README.md) for how to use this module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_env0"></a> [env0](#requirement\_env0) | > 1.4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | ./modules/projects | n/a |
| <a name="module_sub_project"></a> [sub\_project](#module\_sub\_project) | ./modules/projects | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_projects"></a> [projects](#input\_projects) | map of object with names, descriptions, credentials and policies | <pre>map(<br>    object({<br>      name        = string<br>      description = optional(string)<br>      credential  = optional(string)<br>      policy = optional(object({<br>        continuous_deployment_default = optional(bool)<br>        disable_destroy_environments  = optional(bool)<br>        include_cost_estimation       = optional(bool)<br>        number_of_environments        = optional(string)<br>        number_of_environments_total  = optional(string)<br>        requires_approval_default     = optional(bool)<br>        run_pull_request_plan_default = optional(bool)<br>        skip_apply_when_plan_is_empty = optional(bool)<br>        skip_redundant_deployments    = optional(bool)<br>      }))<br>      team_role_assignments = optional(list(<br>        object({<br>          team_name        = string<br>          custom_role_name = string<br>        })<br>      ))<br>      sub_projects = optional(map(<br>        object({<br>          name        = string<br>          description = optional(string)<br>          credential  = optional(string)<br>          policy = optional(object({<br>            continuous_deployment_default = optional(bool)<br>            disable_destroy_environments  = optional(bool)<br>            include_cost_estimation       = optional(bool)<br>            number_of_environments        = optional(string)<br>            number_of_environments_total  = optional(string)<br>            requires_approval_default     = optional(bool)<br>            run_pull_request_plan_default = optional(bool)<br>            skip_apply_when_plan_is_empty = optional(bool)<br>            skip_redundant_deployments    = optional(bool)<br>          }))<br>          team_role_assignments = optional(list(<br>            object({<br>              team_name        = string<br>              custom_role_name = string<br>            })<br>          ))<br>        })<br>      ))<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_projects"></a> [projects](#output\_projects) | n/a |
| <a name="output_sub_projects"></a> [sub\_projects](#output\_sub\_projects) | n/a |
<!-- END_TF_DOCS -->