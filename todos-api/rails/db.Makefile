include ../../common.mk
stack_name = todos-api-db-$(shell basename $(shell pwd))

info:
	$(docker) info

create:
	$(stack) deploy \
		--compose-file docker-compose.db.yml \
		$(stack_name)

delete:
	$(stack) rm $(stack_name)

purge: delete
	$(docker) volume rm --force $(stack_name)_dbdata

status:
	$(stack) services $(stack_name)
	$(stack) ps $(stack_name)

logs:
	$(service) logs $(stack_name)_db

client:
	$(docker) run \
		--rm \
		--network todos-api-rails-dbnet \
		--env PGSSLMODE=require \
		--env PGUSER=postgres \
		--env PGHOST=db \
		--env PGPASSWORD=p0stgres \
		--env PGDATABASE=app \
		-it ghcr.io/infrastructure-as-code/postgres:11-alpine \
		psql
