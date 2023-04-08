# Basic Project Layout

Example Code creates the following project structure:

Team A
|-A1
|-A2
Team B
|-B1
|-B2
Team C

```hcl
projects = {
    teama = {
      name = "Team A"
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
      name = "Team B"
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
      name = "Team C"
      description = "project for Team C"
    }
  }
```