# Use the official PHP 8.2 FPM image as the base
FROM php:8.2-fpm

# Set noninteractive installation for Debian/Ubuntu-based images
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip gd exif intl


RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
&& apt-get install -y nodejs

# Create a symlink so that PHP is available at /usr/local/sbin/php
# RUN ln -sf /usr/local/bin/php /usr/local/sbin/php

RUN ln -s /usr/local/bin/php /usr/local/sbin/php

    

# Install Composer from the official Composer image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# RUN ln -sf /usr/bin/composer /usr/local/sbin/composer


# COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set working directory inside the container
WORKDIR /var/www/html

# Copy your Laravel project into the container
COPY . /var/www/html

# Install PHP dependencies (you can skip dev dependencies for production)
RUN composer install --no-dev --optimize-autoloader


RUN npm install


# Ensure that the storage and cache directories are writable
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose the port that PHP-FPM listens on
EXPOSE 9000

# ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Start PHP-FPM when the container starts
CMD ["php-fpm"]
