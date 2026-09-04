set dotenv-load

# ============================================================================
# ENVIRONMENT
# ============================================================================

DOCKER_COMPOSE := '-f docker-compose.yml'

# ============================================================================
# CONTAINER LIFECYCLE
# ============================================================================

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

# ============================================================================
# CODE QUALITY
# ============================================================================

pint *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec -T xenforo-thread-analyzer /app/vendor/bin/pint --ansi {{ARGS}}

phpstan:
    docker compose {{DOCKER_COMPOSE}} exec -T xenforo-thread-analyzer /app/vendor/bin/phpstan --ansi

phpunit:
    docker compose {{DOCKER_COMPOSE}} exec -T xenforo-thread-analyzer /app/vendor/bin/phpunit tests

rector *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec -T xenforo-thread-analyzer /app/vendor/bin/rector --ansi {{ARGS}}

# ============================================================================
# APPLICATION EXECUTION
# ============================================================================

analyze *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec xenforo-thread-analyzer /app/analyze {{ARGS}}
