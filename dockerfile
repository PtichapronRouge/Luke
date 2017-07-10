FROM php:7.0-apache
RUN apt-get update && apt-get install -y \
	libmbfl-dev \
    && docker-php-ext-configure mbstring --enable-mbstring
    && docker-php-et-install -j$(nproc) mbstring

RUN apt-get install -y \
	

VOLUME ["/var/www/html"]
EXPOSE 80
