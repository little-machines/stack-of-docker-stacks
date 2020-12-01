include ../../common.mk
stack_name = todos-api-$(shell basename $(shell pwd))
service_port = $(buffalo_todos_api_port)
base_url = http://$(manager_host):$(service_port)
include ../todos.mk

info:
	$(docker) info

create:
	SERVICE_PORT=$(service_port) \
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

logs:
	$(service) logs $(stack_name)_migrate
	$(service) logs $(stack_name)_web

cycle:
	make delete
	sleep 60
	make create
	sleep 120
	make status
	make logs

client:
	http $(base_url)/health_check
	http $(base_url)/todos
