include ../common.mk
stack_name = $(shell basename $(shell pwd))

info:
	$(docker) $@

stack node network:
	$(docker) $@ ls

ps:
	$(eval nodes = $(shell $(docker) node ls --format='{{.Hostname}}'))
	@for node in $(nodes); do \
		printf "#### %s ################################################################################\n" $${node}; \
		$(docker) node ps $${node}; \
	done

purge:
	$(eval stacks = $(shell $(docker) stack ls --format='{{.Name}}'))
	$(docker) stack rm $(stacks)
