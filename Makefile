jenkins-bitbucket:
	docker-compose -f ./services/jenkins/bitbucket/docker-compose.yml --p jenkins-bitbucket up -d

jenkins-github:
	docker-compose -f ./services/jenkins/github/docker-compose.yml -p jenkins-github up -d