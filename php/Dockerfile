FROM php:7-fpm

# Install and configure GD.
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install other dependencies. 
RUN docker-php-ext-install opcache pdo pdo_mysql