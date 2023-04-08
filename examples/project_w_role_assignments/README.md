# Project with Role Assignments

**Prereqs:**
Teams and Custom Roles must exist prior.

Example Code creates the following project structure:

Team A
|-Team A - Dev 

```hcl
projects = {
  teama = {
    name        = "Team A"
    description = "Team A"
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
      }
    }
```