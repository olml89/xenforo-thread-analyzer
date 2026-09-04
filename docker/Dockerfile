FROM php:8.5-alpine

# Install composer
COPY --from=composer:2.10.1 /usr/bin/composer /usr/local/bin/composer

# Install xdebug
ARG XDEBUG_PORT=9000
RUN --mount=type=bind,from=mlocati/php-extension-installer:latest,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
    install-php-extensions xdebug

COPY docker/docker-php-ext-xdebug.ini /tmp/docker-php-ext-xdebug.ini
RUN sed "s|\${XDEBUG_PORT}|$XDEBUG_PORT|g" /tmp/docker-php-ext-xdebug.ini > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

WORKDIR /app
