FROM php:8.1-apache

RUN apt-get update && apt-get install -y libsqlite3-dev unzip git \
    && docker-php-ext-install pdo pdo_sqlite

WORKDIR /var/www/html

RUN git clone https://git.tt-rss.org/fox/tt-rss.git . \
    && mkdir -p cache/images cache/upload cache/export \
    && chown -R www-data:www-data /var/www/html

COPY config.php .
COPY ttrss.sqlite .

RUN chown www-data:www-data /var/www/html/ttrss.sqlite && chmod 664 /var/www/html/ttrss.sqlite

EXPOSE 80
ENV PORT=80

