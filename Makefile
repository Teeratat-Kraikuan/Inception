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
	@docker stop $(docker ps -aq)
	@docker rm $(docker ps -aq)
	@docker rmi $(docker images -aq)
	@docker volume rm $(docker volume ls -q)
	@docker network rm $(docker network ls -q)
