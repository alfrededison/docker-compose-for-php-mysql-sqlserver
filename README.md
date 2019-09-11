# Docker compose project for PHP web server

## Services

### Core services
 - Nginx with PHP-fpm, URL query rewrite for PHP framework
 - PHP with fpm, Xdebug and necessary DB drivers
 - MySQL
 - Adminer for DB management

### Extra services
 - MailHog
 - SQL Server 2017 with Full-Text Search
 - Solr 7 with SQL Server driver

## Usage

1. Override environment variable configs by create new `local.env` file.
    ```
    cp .env local.env
    ```

1. Run core services:
    ```
    docker compose --env-file local.env up -d
    ```

1. Run full services:
    ```
    docker compose -f docker-compose.yml -f docker-compose.extras.yml --env-file local.env up -d
    ```

1. Create host for mapping
    ```
    127.0.0.1 site.local
    127.0.0.1 admin.local
    ```

1. Now website is ready at http://site.local and DB admin at http://admin.local
