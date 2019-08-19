FROM php:7-fpm-alpine

RUN docker-php-ext-install mysqli pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir /opt/app

ENTRYPOINT ["php-fpm", "-F"]
