# Dockerfile
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    unzip \
    git \
    nano \
    mariadb-server \
    mariadb-client \
    apache2 \
    lsb-release \
    ca-certificates \
    openssh-server \
    phpmyadmin \
    sqlite3 \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update

# Install PHP 8.3 and necessary extensions
RUN apt-get install -y \
    php8.3-cli \
    php8.3-fpm \
    php8.3-mbstring \
    php8.3-xml \
    php8.3-bcmath \
    php8.3-curl \
    php8.3-tokenizer \
    php8.3-zip \
    php8.3-mysql \
    php8.3-pdo \
    php8.3-common \
    php8.3-gd \
    php8.3-intl \
    php8.3-sqlite3 \
    libapache2-mod-php8.3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable and start SSH and MariaDB services
# RUN systemctl enable ssh && systemctl start ssh \
#     && systemctl enable mariadb && systemctl start mariadb


#set root password to something like #####
#RUN echo "root:####" | chpasswd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure Apache
RUN a2enmod rewrite \
    && chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www


# Expose necessary ports
EXPOSE 8000 80 443 22

# Set working directory
WORKDIR /var/www/project

 
# Entry command
CMD ["apache2ctl", "-D", "FOREGROUND"]
