# Use an official PHP image as the base image
FROM php:8.2-apache

# Install git to enable cloning
RUN apt-get update && apt-get install -y git

# Clone the application repository
RUN git clone https://github.com/phototix/app-docker.git /var/www/html/

# Set proper permissions for the Apache server
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose the default HTTP port
EXPOSE 80
