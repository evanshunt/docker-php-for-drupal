FROM php:5.6-apache

RUN apt-get update -y && apt-get install -y libpng-dev libtidy-dev
RUN docker-php-ext-install gd mysql mysqli tidy pdo pdo_mysql
RUN a2enmod rewrite

COPY php.ini /usr/local/etc/php/
