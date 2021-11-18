##Configuration:

Run `docker compose up` / `docker-compose up`

Each service will need some initial configuration:

###Jenkins:

URL: localhost:8080

The admin password can be found within the logs, for example:
  
      jenkins       | Jenkins initial setup is required. An admin user has been created and a password generated.
      jenkins       | Please use the following password to proceed to installation:
      jenkins       |
      jenkins       | 3b78d15973064d58b93eb42abd5caf5c
  
###Bitbucket:

URL: localhost:7990

`select language > internal (demo use) > complete licensing section (can use trial) > setup credentials`

Once this is complete, login with these creds & setup a project and repository. Then, configure your git remote to point to the repo (url should begin with 'http://localhost:7990/'). 