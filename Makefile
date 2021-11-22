jenkins-bitbucket:
	docker-compose -f ./services/bitbucket/docker-compose.yml up --build

jenkins-github:
	docker-compose -f ./services/github/docker-compose.yml up --build