jenkins-bitbucket:
	docker-compose -f ./services/jenkins/bitbucket/docker-compose.yml up -d

jenkins-github:
	docker-compose -f ./services/jenkins/github/docker-compose.yml up -d