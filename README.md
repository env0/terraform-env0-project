[<img src="https://assets-global.website-files.com/5dc3f52851595b160ba99670/6037a6f27d9050ef91b90a86_env0-opengraph%402x.png" alt="env0 Logo" width="300">](https://env0.com)

# Terraform env0 Project Module
Using the env0 TF provider to create an env0 Project along with configuring the project policy.

Each project will use the same policy

example projects variable
```
projects={
  dev0 = {
    name        = "Team A - Dev"
    description = "Team A's Dev Instance"
    credential  = "dev creds"
    policy      = local.dev_policy
  }
  dev1 = {
    name = "Team B - Dev"
    description = "Team B's Dev Instance"
    credential  = "dev creds"
    policy      = local.dev_policy
  }
  prod0 = {
    name = "Team A - Prod"
    description = "Team A's Prod Instance"
    credential  = "prod creds"
    policy      = local.prod_policy
  }
}
```

example policy
```
locals {
  policy = {
    "disable_destroy_environments"  = false
    "include_cost_estimation"       = true
    "number_of_environments"        = "3"
    "number_of_environments_total"  = "10"
    "requires_approval_default"     = false
    "skip_apply_when_plan_is_empty" = true
    "skip_redundant_deployments"    = true
    "continuous_deployment_default" = true 
    "run_pull_request_plan_default" = true  
  }
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
| [env0_cloud_credentials_project_assignment.credential_project](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/resources/cloud_credentials_project_assignment) | resource |
| [env0_project.project](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/resources/project) | resource |
| [env0_project_policy.policy](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/resources/project_policy) | resource |
| [env0_aws_credentials.credentials](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/data-sources/aws_credentials) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_projects"></a> [projects](#input\_projects) | map of object with names, descriptions, credentials and policies e.g. {dev0={name="dev",description="this is my dev project",credential="aws dev",policy=local.devpolicy}} | <pre>map(<br>    object({<br>      name        = string<br>      description = string<br>      credential  = string<br>      policy = object({<br>        continuous_deployment_default = optional(bool)<br>        disable_destroy_environments  = bool<br>        include_cost_estimation       = bool<br>        number_of_environments        = string<br>        number_of_environments_total  = string<br>        requires_approval_default     = bool<br>        run_pull_request_plan_default = bool<br>        skip_apply_when_plan_is_empty = bool<br>        skip_redundant_deployments    = bool<br>      })<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
