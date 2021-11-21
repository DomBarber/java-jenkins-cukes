jenkins-bitbucket:
    docker compose up -p jenkins-bitbucket -f ./services/jenkins/bitbucket/docker-compose.yml

jenkins-github:
    docker compose up -p jenkins-github -f ./services/jenkins/github/docker-compose.yml