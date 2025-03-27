# Use an official PHP image as the base image
FROM php:8.2-apache

# Copy the PHP application to the container's web root
COPY index.php /var/www/html/

# Expose the default HTTP port
EXPOSE 80
