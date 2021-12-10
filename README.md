[<img src="https://assets-global.website-files.com/5ceab5395d0f478e169de7c0/5ceab5395d0f4742dd9de7d0_Env0-Color%202.svg" alt="env0 Logo" width="300">](https://env0.com)

# Terraform env0 Project Module
Using the env0 TF provider to create an env0 Project along with configuring the project policy.

example projects variable
```
projects={
  dev0 = {
    name = "Team A - Dev"
    description = "Team A's Dev Instance"
  }
  dev1 = {
    name = "Team B - Dev"
    description = "Team B's Dev Instance"
  }
  dev2 = {
    name = "Team C - Prod"
    description = "Team C's Dev Instance"
  }
}
```

example policy
```
  policy = {
    "disable_destroy_environments"  = false
    "include_cost_estimation"       = true
    "number_of_environments"        = "3"
    "number_of_environments_total"  = "10"
    "requires_approval_default"     = "false"
    "skip_apply_when_plan_is_empty" = true
    "skip_redundant_deployments"    = true
    "continuous_deployment_default" = true 
    "run_pull_request_plan_default" = false  
  }
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_env0"></a> [env0](#requirement\_env0) | 0.0.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_env0"></a> [env0](#provider\_env0) | 0.0.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [env0_project.project](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/resources/project) | resource |
| [env0_project_policy.policy](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/resources/project_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy"></a> [policy](#input\_policy) | project policy | <pre>object({<br>    continuous_deployment_default = optional(bool)<br>    disable_destroy_environments  = bool<br>    include_cost_estimation       = bool<br>    number_of_environments        = string<br>    number_of_environments_total  = string<br>    requires_approval_default     = bool<br>    run_pull_request_plan_default = bool<br>    skip_apply_when_plan_is_empty = bool<br>    skip_redundant_deployments    = bool<br>  })</pre> | <pre>{<br>  "continuous_deployment_default": false,<br>  "disable_destroy_environments": false,<br>  "include_cost_estimation": true,<br>  "number_of_environments": "3",<br>  "number_of_environments_total": "10",<br>  "requires_approval_default": false,<br>  "run_pull_request_plan_default": false,<br>  "skip_apply_when_plan_is_empty": true,<br>  "skip_redundant_deployments": true<br>}</pre> | no |
| <a name="input_projects"></a> [projects](#input\_projects) | map of object with names and descriptions e.g. {dev0={name="dev",description="this is my dev project"}} | <pre>map(<br>    object({<br>      name        = string<br>      description = string<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->