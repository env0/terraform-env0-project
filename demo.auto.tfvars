projects = {
  teama = {
    name        = "Team A"
    description = "Team A"
    sub_projects = {
      dev = {
        name        = "Team A - Dev"
        description = "Team A's Dev Instance"
      }
      qa = {
        name        = "Team A - QA"
        description = "Team B's Dev Instance"
      }
      prod = {
        name        = "Team A - Prod"
        description = "Team A's Prod Instance"
      }
    } # credential  = ""
    # policy = {
    #   "disable_destroy_environments"  = false
    #   "include_cost_estimation"       = true
    #   "number_of_environments"        = "3"
    #   "number_of_environments_total"  = "10"
    #   "requires_approval_default"     = false
    #   "skip_apply_when_plan_is_empty" = true
    #   "skip_redundant_deployments"    = true
    #   "continuous_deployment_default" = true
    #   "run_pull_request_plan_default" = true
    # }
  }
}