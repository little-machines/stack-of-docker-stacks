host = zero00
docker_host = DOCKER_HOST=ssh://vtse@$(host) DOCKER_TIMEOUT=300
docker = $(docker_host) docker
stack = $(docker) stack
service = $(docker) service
