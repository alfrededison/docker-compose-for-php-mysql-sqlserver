FROM php:7.1-fpm-jessie

# Default Config
RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Mysql
RUN docker-php-ext-install mysqli

# Microsoft SQL Server
ENV ACCEPT_EULA=Y
RUN apt-get update \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/8/prod.list \
        > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get install -y --no-install-recommends \
        locales \
        apt-transport-https \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && apt-get update \
    && apt-get -y --no-install-recommends install msodbcsql unixodbc-dev

RUN pecl install sqlsrv-5.6.1 pdo_sqlsrv-5.6.1 \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv

# Xdebug
RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

# SOAP
RUN apt-get install -y libxml2-dev && \
    docker-php-ext-install soap
