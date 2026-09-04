FROM php:8.5-alpine

# Install PHP extensions
RUN --mount=type=bind,from=mlocati/php-extension-installer:latest,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
    install-php-extensions intl xdebug

# Configure xdebug
ARG XDEBUG_PORT=9000
COPY docker/docker-php-ext-xdebug.ini /tmp/docker-php-ext-xdebug.ini
RUN sed "s|\${XDEBUG_PORT}|$XDEBUG_PORT|g" /tmp/docker-php-ext-xdebug.ini > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Install composer
COPY --from=composer:2.10.1 /usr/bin/composer /usr/local/bin/composer

WORKDIR /app
