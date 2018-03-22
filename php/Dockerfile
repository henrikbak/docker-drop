FROM php:7.1-fpm

# Install packages.
RUN apt-get update && apt-get install -y \ 
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    wget \
    curl \
    git \
    zip \
    unzip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install PHP extensions. 
RUN docker-php-ext-install opcache pdo pdo_mysql

# Install Composer.
RUN wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Plugin for parallel composer install.
RUN composer global require hirak/prestissimo

# Drupal Console.
RUN curl https://drupalconsole.com/installer -L -o drupal.phar \
    && mv drupal.phar /usr/local/bin/drupal \
    && chmod +x /usr/local/bin/drupal