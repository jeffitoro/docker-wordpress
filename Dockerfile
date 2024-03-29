FROM wordpress:php7.4-apache
 
# Install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
 
# Install Less for WP-CLI
RUN apt-get update && apt-get -y install less vim
 
# Install WP-CLI
RUN curl -s -o /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

ADD config/php.conf.ini /usr/local/etc/php/conf.d/conf.ini

EXPOSE 80
