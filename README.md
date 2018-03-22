# Docker Drop

A Docker development setup optimized for Drupal 8.

## Development stack
- Nginx
- PHP 7
- Mysql

## Getting started:

1: Start/build the Docker containers.
```
$ docker-compose up -d
```
2: Download Drupal using Composer.
```
$ make drupal-download
```
*This will download the drupal/drupal project from packagist to the /web folder and run a composer install. (Reference: https://packagist.org/packages/drupal/drupal)*.

3: Install Drupal.
*Go to http://localhost:8080 and complete the installation.*

## .env
The environment file contains credentials and version numbers for the Docker containers. This information is included both in the docker-compose.yml and the makefile.

## Makefile
The Makefile is intended to simplify the execution of commonly used commands. It is particularily useful for executing commands inside the Docker containers.

### Composer
Composer is installed globally inside the PHP container, which enables us to execute Composer commands.

```
$ make composer <command>
$ make composer -- <command> --<arguments>
```

### Database
Import database
```
$ make mysql-import
```
*This will import dumps/dump.sql to your database*

Export database
```
$ make mysql-export
```
*This will export your database to dumps/dump.sql*