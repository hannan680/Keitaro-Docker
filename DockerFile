FROM php:8.1-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    zip unzip curl wget libonig-dev libxml2-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql zip gd

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Download Keitaro installer
RUN curl -O https://cdn.keitaro.io/installer.sh && chmod +x installer.sh

# Optional: Install Keitaro (or you can run this manually from the container)
# RUN ./installer.sh --type panel --non-interactive

EXPOSE 80
