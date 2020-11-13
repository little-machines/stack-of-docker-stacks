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

purge: delete

status:
	$(stack) services $(stack_name)
	$(stack) ps $(stack_name)

logs:
	$(service) logs $(stack_name)_producer 2>&1 | tail -n 10
	$(service) logs $(stack_name)_processor_a 2>&1 | tail -n 10
	$(service) logs $(stack_name)_processor_b 2>&1 | tail -n 10
	$(service) logs $(stack_name)_consumer 2>&1 | tail -n 10

cycle:
	make delete
	sleep 60
	make create
	sleep 120
	make status
	make logs

client:
