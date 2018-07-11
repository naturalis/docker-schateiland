FROM php:5-apache

MAINTAINER Hugo van Duijn <hugo.vanduijn@naturalis.nl>
LABEL Description="LAMP stack, modified for schateiland application." 

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        locales-all \
        libpng-dev \
        libedit-dev \
        libreadline-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install and activate php and apache modules
RUN docker-php-ext-install mysqli && \
    docker-php-ext-install mysql && \
    docker-php-ext-install gd && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install json && \
    docker-php-ext-install opcache && \
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-install readline && \
    a2enmod rewrite

RUN pecl config-set php_ini /etc/php5/apache2/php.ini && \
    pecl install apcu-4.0.11 && \
#    echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini&& \
    docker-php-ext-enable apcu 


# add files into container
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
