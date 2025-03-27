# Use the official PHP image with Apache
FROM php:8.2-apache

# Install required dependencies and MariaDB
RUN apt-get update && apt-get install -y \
    mariadb-server \
    git \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Start MariaDB and configure the database
RUN mysqld --skip-networking & \
    sleep 10 && \
    mysql -e "CREATE DATABASE webbycms;" && \
    mysql -e "CREATE USER 'webbycms'@'localhost' IDENTIFIED BY '#QyDexen!64A#';" && \
    mysql -e "GRANT ALL PRIVILEGES ON webbycms.* TO 'webbycms'@'localhost';" && \
    mysqladmin shutdown

# Clone the application repository
RUN git clone https://github.com/phototix/webbycms.git /var/www/html/

# Expose the Apache and MySQL ports
EXPOSE 80 3306

# Start Apache and MariaDB
CMD service mysql start && apache2-foreground
