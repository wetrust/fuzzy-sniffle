FROM php:7-fpm-alpine
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
  docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
  && docker-php-ext-install gd pdo pdo_mysql && \
    apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev \
  echo 'memory_limit = 512M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini
