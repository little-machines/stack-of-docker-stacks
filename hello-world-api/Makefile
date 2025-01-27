include ../common.mk
stack_name = $(shell basename $(shell pwd))
replicas = 1

info:
	$(docker) info

create:
	SERVICE_PORT=$(hello_world_api_port) \
	$(stack) deploy \
		--compose-file docker-compose.yml \
		$(stack_name)

delete:
	$(stack) rm $(stack_name)

purge: delete
	$(docker) volume rm --force $(stack_name)_dbdata

status:
	$(stack) services $(stack_name)
	$(stack) ps $(stack_name)

scale:
	$(service) scale $(stack_name)_api=$(replicas)

logs:
	$(service) logs $(stack_name)_api
	$(service) logs $(stack_name)_client

cycle:
	make delete
	sleep 60
	make create
	sleep 120
	make status
	make logs

client:
	curl -v http://$(manager_host):$(hello_world_api_port)/health
	curl -v http://$(manager_host):$(hello_world_api_port)
