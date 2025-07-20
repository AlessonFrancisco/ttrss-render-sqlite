FROM php:8.2-apache

# Instala dependências do TT-RSS
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libsqlite3-dev \
    sqlite3 \
    && docker-php-ext-install pdo pdo_sqlite

# Clona o TT-RSS
RUN git clone https://git.tt-rss.org/fox/tt-rss.git /var/www/html

# Ajusta permissões
RUN chown -R www-data:www-data /var/www/html

# Habilita módulos do Apache
RUN a2enmod rewrite

# Porta padrão do Render
EXPOSE 10000

# Define o diretório de trabalho
WORKDIR /var/www/html

CMD ["apache2-foreground"]
