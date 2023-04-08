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