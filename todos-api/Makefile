include ../common.mk
stack_name = $(shell basename $(shell pwd))

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
	$(service) logs $(stack_name)_migrate
	$(service) logs $(stack_name)_db
	$(service) logs $(stack_name)_web

cycle:
	make delete
	sleep 60
	make create
	sleep 120
	make status
	make logs
