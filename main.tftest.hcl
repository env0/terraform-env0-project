run "project-validation-test" {
  variables {
  projects = {
      teama = {
        name        = "Team A"
        description = "project for Team A"
        sub_projects = {
          a1 = {
            name = "A1"
          }
          a2 = {
            name = "A2"
          }
        }
      }
      teamb = {
        name        = "Team B"
        description = "project for Team B"
        sub_projects = {
          b1 = {
            name = "B1"
          }
          b2 = {
            name = "B2"
          }
        }
      }
      teamc = {
        name        = "Team C"
        description = "project for Team C"
      }
    }
  }

  assert {
    condition     = module.project.projects["teama"].name == "Team A"
    error_message = "Team A Project creation failed"
  }
}