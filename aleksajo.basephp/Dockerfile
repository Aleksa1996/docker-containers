FROM php:7.3-fpm-alpine

RUN docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-install pdo \
    && docker-php-ext-enable pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql
