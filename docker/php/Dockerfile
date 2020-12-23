FROM php:8.0-fpm-buster

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
    libicu-dev \
    libonig-dev \
    libzip-dev \
    unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install \
    bcmath \
    pdo_mysql

COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

WORKDIR /work
