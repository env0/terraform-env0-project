projects = {
  teama = {
    name        = "Team A"
    description = "Team A"
    team_role_assignments = {
      a = {
        team_name = "Admin Team"
        custom_role_name = "Project Admins"
      }
      b = {
        team_name = "Dev Team"
        custom_role_name = "Engineers" 
      }
      # a = {
      #   team_id        = "b532e1fb-8c34-40cd-bf42-c01b33c0b5b4" # admin team
      #   custom_role_id = "1010dae0-da6a-4f54-8dfc-77d6706c41da" #admin role
      # }
      # b = {
      #   team_id        = "33d5bd94-790c-490d-80aa-cb43851013f9" # dev team
      #   custom_role_id = "09100f15-1bec-408d-8d26-ff7dd285033b" # engineer role
      # }
    }
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