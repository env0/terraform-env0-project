terraform {
  required_version = ">= 1.2.0"

  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "> 1.4.0"
    }
  }
}


module "my_projects" {
  source = "../../"

  projects = {
    teama = {
      name        = "Team Acme"
      description = "Team Acme"
      credential  = "arn:aws:iam::244172364962:role/acme-fitness-deployer"
      team_role_assignments = [
        {
          team_name        = "Admin Team"
          custom_role_name = "Project Admins"
        },
      ]
      sub_projects = {
        dev = {
          name        = "Team A - Dev"
          description = "Team A's Dev Instance"
          credential  = "arn:aws:iam::244172364962:role/acme-fitness-deployer"
          team_role_assignments = [
            {
              team_name        = "Admin Team"
              custom_role_name = "Project Admins"
            },
            {
              team_name        = "Dev Team"
              custom_role_name = "Project Admins"
            }
          ]
          policy = {
            "disable_destroy_environments"  = false
            "include_cost_estimation"       = true
            "number_of_environments"        = "3"
            "number_of_environments_total"  = "10"
            "requires_approval_default"     = false
            "skip_apply_when_plan_is_empty" = true
            "skip_redundant_deployments"    = true
            "continuous_deployment_default" = true
            "run_pull_request_plan_default" = false
            "default_ttl"                   = "1-d"
            "max_ttl"                       = "1-w"
          }
        }
        qa = {
          name        = "Team A - QA"
          description = "Team B's Dev Instance"
          team_role_assignments = [
            {
              team_name        = "Admin Team"
              custom_role_name = "Project Admins"
            },
            {
              team_name        = "Dev Team"
              custom_role_name = "Engineers"
            }
          ]
        }
        prod = {
          name        = "Team A - Prod"
          description = "Team A's Prod Instance"
          team_role_assignments = [
            {
              team_name        = "Admin Team"
              custom_role_name = "Project Admins"
            }
          ]
          policy = {
            "disable_destroy_environments" = true
            "requires_approval_default"    = true
          }
        }
      }
    }
  }
}