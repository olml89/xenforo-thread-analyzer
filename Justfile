set dotenv-load

DOCKER_COMPOSE := '-f docker-compose.yml'

build:
    docker compose {{DOCKER_COMPOSE}} build --no-cache

up:
    docker compose {{DOCKER_COMPOSE}} up --remove-orphans

upd:
	docker compose {{DOCKER_COMPOSE}} up -d --remove-orphans

stop:
	docker compose {{DOCKER_COMPOSE}} stop

down:
	docker compose {{DOCKER_COMPOSE}} down

sh:
    docker compose {{DOCKER_COMPOSE}} exec xenforo-thread-analyzer /bin/sh

analyze *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec xenforo-thread-analyzer /app/analyze {{ARGS}}
