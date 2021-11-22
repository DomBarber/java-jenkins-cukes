## Configuration:

Run `docker compose up` / `docker-compose up`

Each service will need some initial configuration:

### Jenkins Setup (Local Server):

URL: localhost:8080

You will be required to enter the admin password found within the logs, for example:
  
      jenkins       | Jenkins initial setup is required. An admin user has been created and a password generated.
      jenkins       | Please use the following password to proceed to installation:
      jenkins       |
      jenkins       | 3b78d15973064d58b93eb42abd5caf5c

Proceed & setup the Jenkins plugins for your requirements. 'Install suggested plugins' is the recommended quickstart option.
Some other useful plugins are `Docker` and `Docker Pipeline` which can be manually installed afterwards, via `Manage Jenkins > Manage Plugins`
(If using Docker don't forget to set this up within Jenkins, under `Global Tool Configuration`)
  
Now configure an admin user, then the Jenkins URL (default is http://localhost:8080/). Save and Finish.

Jenkins is now ready to use, however to integrate with Bitbucket there's some additional setup to do.

### Jenkins / GitHub Integration

Everything needed to integrate with GitHub should come out of the box, however if hosting Jenkins locally then the URL will need to be visible to GitHub. 
`ngrok` https://ngrok.com/ can be used for this purpose, helping to quickly expose the URL and tunnel traffic.

After extracting the ngrok package, add it to your path or `cd` into the directory containing the executable & run `./ngrok http 8080` -
this will generate a URL GitHub can use to access the local Jenkins instance.

#### 1. Creating a Webhook:

`Settings > Webhooks > Add Webhook`
- Payload URL = `${JENKINS_BASE_URL}/github-webhook/`
- Content type = `application/json`
- Secret = `leave this empty`
- Events = `'Let me select individual events' > Pushes, Pull Requests`

#### 2. Adding Source Code Management to pipeline

First, a Personal Access Token needs to be created within GitHub: `Settings > Developer settings > personal access tokens`

Generate a new token, giving it suitable scope & expiration length, such as 'repo' + 'workflow'. Once this is done copy & save the token.

Now go to Jenkins:
`Jenkins Dashboard > (Select an item/job) > Configure > Source Code Management`

Select 'Git', then add the URL to the GitHub repository along with the token, e.g. `https://${token}@github.com/organisation/repo`. 
Credentials will not be needed here.

Now, head to `Jenkins Dashboard > Manage Jenkins > Manage Credentials` and add a new global credentials of type `Secret Text`.
Enter the Personal Access Token into 'Secret', give it an ID (optional) and provide a description.

This will be used at `Jenkins Dashboard > Manage Jenkins > Configure System > GitHub`
Select 'add GitHub Server' and give this a 'Name', leave 'API URL' as default unless using GitHub Enterprise, finally select the credentials from earlier & check 'Manage hooks'.


### Jenkins / Bitbucket Integration

In order to integrate with Bitbucket some extra plugins will be needed, these are easily installed from the Jenkins Plugin Manager:

`Jenkins Dashboard > Manage Jenkins > Manage Plugins > Available`

Search for both `Bitbucket Server Integration`, and `Bitbucket`, ticking the box for each. Finally, select `Install without restart`.

Once this has finished, you can go to `Jenkins Dashboard > Manage Jenkins > Configure System` where some new fields applicable to Bitbucket are available.

Check out the guide at https://plugins.jenkins.io/atlassian-bitbucket-server-integration/

### Bitbucket Setup (Local Server):

URL: localhost:7990

`select language > internal (demo use) > complete licensing section (can use trial) > setup credentials`

Once this is complete, login with these creds & setup a project and repository. Then, configure your git remote to point to the repo (url should begin with 'http://localhost:7990/').

Such as:
`git remote set-url origin http://localhost:7990/scm/san/java-cukes-jenkins.git`

Add your SSH key to bitbucket (handy for later), easily copied via `pbcopy < ~/.ssh/id_rsa.pub`. Generate a fresh key/pair before doing this if desired.

Bitbucket should now be up and running on the localhost.

### Known Issues

- Running Docker-in-Docker. This will likely result in various permission issues & an inability to access the host installation from the Jenkins container (docker will be `: not found` as a first symptom).
Workarounds are possible (and already in place here for Mac OS), so mostly a heads up that some troubleshooting may be required.
