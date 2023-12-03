all: up

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

clean: down
	@if [ -z $$(docker image ls -qa) ]; then \
		echo "No images found."; \
	else \
		docker image rm -f $$(docker images -qa); \
	fi
	@if [ -z $$(docker volume ls -q) ]; then \
		echo "No volumes found."; \
	else \
		docker volume rm $$(docker volume ls -q); \
	fi

fclean: clean
	docker system prune -af
	docker volume prune -f

re: clean up

.PHONY: all up down stop start clean re
