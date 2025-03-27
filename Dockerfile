# Use the official PHP image with Apache
FROM php:8.2-apache

# Install required dependencies and MySQL extension for PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Install MySQL server (for running MySQL inside the container)
RUN apt-get install -y mysql-server

# Configure MySQL (you can adjust these settings)
RUN service mysql start && mysql -e "CREATE DATABASE webbycms;" && \
    mysql -e "CREATE USER 'webbycms'@'localhost' IDENTIFIED BY '#QyDexen!64A#';" && \
    mysql -e "GRANT ALL PRIVILEGES ON webbycms.* TO 'webbycms'@'localhost';"

# Clone the application repository
RUN git clone https://github.com/phototix/webbycms.git /var/www/html/

# Expose the Apache and MySQL ports
EXPOSE 80 3306

# Start MySQL and Apache
CMD service mysql start && apache2-foreground
