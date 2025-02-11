FROM dunglas/frankenphp

WORKDIR /app
RUN apt update && apt install -y zip libzip-dev nano

RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    opcache \
    bcmath \
    mbstring \
    pcntl 
    # oci8

COPY . .

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader

# Install Octane
RUN composer require laravel/octane

# Run Octane installation
RUN php artisan octane:install
# RUN php artisan octane:install --no-interaction

# CMD ["php", "artisan", "octane:start", "--server=frankenphp", "--host=0.0.0.0", "--port=8000"]
CMD ["docker-php-entrypoint", "php", "artisan", "octane:start", "--server=frankenphp", "--host=0.0.0.0", "--port=8000"]
