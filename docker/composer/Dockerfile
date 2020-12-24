FROM php:8.0-alpine

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

# phpのコンテナと同じ設定ファイルを使う
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

WORKDIR /work
