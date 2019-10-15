FROM php:7.3-fpm-alpine

RUN apk update && apk add \
    nano\
    curl \
    openssh \
    gmp-dev \
    zlib-dev \
    icu-dev \
    g++ \
    postgresql-dev \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*


RUN docker-php-ext-install mysqli \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install intl \
    && docker-php-ext-install pgsql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install gmp
