FROM php:8.1-apache

# Instala dependências e extensões necessárias
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    git \
    unzip \
    && docker-php-ext-install pdo pdo_sqlite \
    && apt-get clean

# Define diretório de trabalho
WORKDIR /var/www/html

# Clona o código do TT-RSS
RUN git clone https://git.tt-rss.org/fox/tt-rss.git . \
    && mkdir -p cache/images cache/upload cache/export \
    && chown -R www-data:www-data /var/www/html

# Copia os arquivos de configuração
COPY config.php /var/www/html/
COPY ttrss.sqlite /var/www/html/

# Permissões do SQLite
RUN chown www-data:www-data /var/www/html/ttrss.sqlite && chmod 664 /var/www/html/ttrss.sqlite

# Ativa o módulo rewrite do Apache (necessário)
RUN a2enmod rewrite

# Expõe porta padrão e define porta de ambiente para Render
EXPOSE 80
ENV PORT=80
