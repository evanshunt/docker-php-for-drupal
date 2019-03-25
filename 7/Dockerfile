FROM php:5.6-apache

RUN apt-get update -y && apt-get install -y libpng-dev libtidy-dev
RUN docker-php-ext-install gd mysql mysqli tidy pdo pdo_mysql
RUN a2enmod rewrite

COPY php.ini /usr/local/etc/php/

RUN apt-get update -y && apt-get install -y curl wget vim git unzip mysql-client

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN composer global require drush/drush

ENV PATH "~/.composer/vendor/bin:$PATH"
