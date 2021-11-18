##Configuration:

Run `docker compose up` / `docker-compose up`

Each service will need some initial configuration:

###BitBucket:

URL: localhost:7990

`select language > internal (demo use) > complete licensing section (can use trial) > setup credentials`

Once this is complete, login with these creds & setup a project and repository. Then, configure your git remote to point to the repo (url should begin with 'http://localhost:7990/').

Such as:
`git remote set-url origin http://localhost:7990/scm/san/java-cukes-jenkins.git`

Add your SSH key to bitbucket (handy for later), easily copied via `pbcopy < ~/.ssh/id_rsa.pub`. Generate a fresh key/pair before doing this if desired.

Bitbucket should now up and running on the localhost.

###Jenkins:

URL: localhost:8080

You will be required to enter the admin password found within the logs, for example:
  
      jenkins       | Jenkins initial setup is required. An admin user has been created and a password generated.
      jenkins       | Please use the following password to proceed to installation:
      jenkins       |
      jenkins       | 3b78d15973064d58b93eb42abd5caf5c

Proceed & setup the Jenkins plugins for your requirements. 'Install suggested plugins' is the recommended quickstart option.
  
Now configure an admin user, then the Jenkins URL (default is http://localhost:8080/). Save and Finish.

Jenkins is now ready to use, however to integrate with BitBucket there's some additional setup to do.

####Jenkins - integrating with BitBucket

In order to integrate with BitBucket some extra plugins will be needed, these are easily installed from the Jenkins Plugin Manager:

`Jenkins Dashboard > Manage Jenkins > Manage Plugins > Available`

Search for both `Bitbucket Server Integration`, and `Bitbucket`, ticking the box for each. Finally, select `Install without restart`.

Once this has finished, you can go to `Jenkins Dashboard > Manage Jenkins > Configure System` where some new fields applicable to BitBucket are available.

Check out the guide at https://plugins.jenkins.io/atlassian-bitbucket-server-integration/