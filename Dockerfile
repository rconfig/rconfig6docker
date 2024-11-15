# Use the official PHP image with Apache as the base
FROM php:8.3-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    default-libmysqlclient-dev \
    zip vim \
    redis-server \
    unzip \
    supervisor \
    cron \
    netcat-openbsd \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure zip \
    && docker-php-ext-install gd zip pdo pdo_mysql pcntl \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && pecl install redis \
    && docker-php-ext-enable redis

RUN a2enmod rewrite

# Create application directory
RUN mkdir -p /var/www/html/rconfig

# Set working directory
WORKDIR /var/www/html/rconfig

# Copy the Laravel application files to the new working directory
COPY ./rconfig .

# Set up permissions for storage and cache (important for Laravel)
RUN chown -R www-data:www-data /var/www/html/rconfig/storage /var/www/html/rconfig/bootstrap/cache \
    && chmod -R 775 /var/www/html/rconfig/storage /var/www/html/rconfig/bootstrap/cache

# Configure Apache to use Laravel's public directory
RUN echo "DocumentRoot /var/www/html/rconfig/public" > /etc/apache2/sites-available/000-default.conf \
    && echo "<Directory /var/www/html/rconfig/public>" >> /etc/apache2/sites-available/000-default.conf \
    && echo "    AllowOverride All" >> /etc/apache2/sites-available/000-default.conf \
    && echo "    Require all granted" >> /etc/apache2/sites-available/000-default.conf \
    && echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf

# Expose port 80 (default HTTP port)
EXPOSE 80

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN mkdir -p /var/log && chown -R www-data:www-data /var/log

# Start supervisord to run cron, horizon, and PHP-FPM
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
