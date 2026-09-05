set dotenv-load

# ============================================================================
# ENVIRONMENT
# ============================================================================

DOCKER_COMPOSE := '-f docker-compose.yml'

XDEBUG := if env_var_or_default("XDEBUG_TRIGGER", "") == "1" {
    "-e XDEBUG_TRIGGER=1"
} else {
    ""
}

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

# ============================================================================
# COMMAND EXECUTION
# ============================================================================

debug *ARGS:
    XDEBUG_TRIGGER=1 just {{ARGS}}

sh *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec {{XDEBUG}} xenforo-thread-analyzer /bin/sh

analyze *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec -T {{XDEBUG}} xenforo-thread-analyzer /app/analyze {{ARGS}}

# ============================================================================
# CODE QUALITY
# ============================================================================

pint *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec -T {{XDEBUG}} xenforo-thread-analyzer /app/vendor/bin/pint --ansi {{ARGS}}

phpstan:
    docker compose {{DOCKER_COMPOSE}} exec -T {{XDEBUG}} xenforo-thread-analyzer /app/vendor/bin/phpstan --ansi

phpunit:
    docker compose {{DOCKER_COMPOSE}} exec -T {{XDEBUG}} xenforo-thread-analyzer /app/vendor/bin/phpunit tests

rector *ARGS:
    docker compose {{DOCKER_COMPOSE}} exec -T {{XDEBUG}} xenforo-thread-analyzer /app/vendor/bin/rector --ansi {{ARGS}}
