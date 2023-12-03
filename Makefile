all: up

up:
	@docker-compose ./srcs/docker-compose.yml up -d

down:
	@docker-compose ./srcs/docker-compose.yml down

stop:
	@docker-compose ./srcs/docker-compose.yml stop

start:
	@docker-compose ./srcs/docker-compose.yml start

clean:
	@docker system prune -a --force
