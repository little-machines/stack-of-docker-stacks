manager_host ?= zero00
docker_host = DOCKER_HOST=ssh://vtse@$(manager_host) DOCKER_TIMEOUT=300
docker = $(docker_host) docker
stack = $(docker) stack
service = $(docker) service

# port assignments
hello_world_api_port = 8001
todos_api_port = 3000
