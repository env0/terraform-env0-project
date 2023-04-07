projects = {
  teama = {
    name        = "Team A"
    description = "Team A"
    credential  = ""
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
  dev = {
    name        = "Team A - Dev"
    description = "Team A's Dev Instance"
    credential  = "dev creds"
    parent_project = "Team A"
    policy = {
      "disable_destroy_environments"  = false
      "include_cost_estimation"       = true
      "number_of_environments"        = null
      "number_of_environments_total"  = null
      "requires_approval_default"     = false
      "skip_apply_when_plan_is_empty" = true
      "skip_redundant_deployments"    = true
      "continuous_deployment_default" = true
      "run_pull_request_plan_default" = true
    }
  }
  qa = {
    name        = "Team A - QA"
    description = "Team B's Dev Instance"
    credential  = "dev creds"
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
  prod = {
    name        = "Team A - Prod"
    description = "Team A's Prod Instance"
    credential  = "prod creds"
    policy = {
      "disable_destroy_environments"  = true
      "include_cost_estimation"       = false
      "number_of_environments"        = null
      "number_of_environments_total"  = null
      "requires_approval_default"     = true
      "skip_apply_when_plan_is_empty" = true
      "skip_redundant_deployments"    = true
      "continuous_deployment_default" = false
      "run_pull_request_plan_default" = true
    } 
  }
}