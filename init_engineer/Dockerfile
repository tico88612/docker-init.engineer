FROM php:7.4-fpm
RUN apt update && apt install -y libmcrypt-dev \
    mariadb-client libmagickwand-dev libpng-dev \
    libonig-dev libzip-dev zip libpng-dev libjpeg-dev \
    libfreetype6-dev --no-install-recommends \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && pecl install imagick mcrypt \
    && docker-php-ext-enable imagick mcrypt \
    && docker-php-ext-install zip pdo_mysql mbstring gd \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

COPY init.engineer /app

RUN composer install

COPY entrypoint.sh .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

EXPOSE 8000
