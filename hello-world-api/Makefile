include ../common.mk
stack_name = hello-world-api

info:
	$(docker) info

create:
	$(stack) deploy \
		--compose-file docker-compose.yml \
		$(stack_name)

delete:
	$(stack) rm $(stack_name)

status:
	$(stack) services $(stack_name)
	$(stack) ps $(stack_name)

logs:
	$(service) logs $(stack_name)_api
	$(service) logs $(stack_name)_client
