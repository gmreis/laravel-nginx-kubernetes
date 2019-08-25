FROM php:7-fpm-alpine

RUN docker-php-ext-install mysqli pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir /opt/app

ARG USER_ID
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME

RUN addgroup -S -g ${GROUP_ID} ${GROUP_NAME} && \
    adduser -SDH -u ${USER_ID} -G ${GROUP_NAME} ${USER_NAME} && \
    adduser ${USER_NAME} www-data && \
    adduser www-data ${GROUP_NAME}


ENTRYPOINT ["php-fpm", "-F"]
