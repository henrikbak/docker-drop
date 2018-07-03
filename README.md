# Docker Drop

A Docker development setup optimized for Drupal 8.

## Stack
|Container|Version|Port|
|---|---|---|
|Nginx|1.14|8000
|PHP|7.1.15|-
|MYSQL|5.7|3306
|Mailhog|0.1.9|8025

## Tools
|Name|Version|
|---|---|
|Composer|Latest|
|Drupal Console|~1.0|
|Drush|~9.0|
|Drush Launcher|0.6.0|

## Getting started:

1: Start/build the Docker containers.
```
$ docker-compose up -d
```
2: Download Drupal using Composer.
```
$ make drupal-kickstart
```
*This will download the drupal/drupal project from packagist to the /web folder and run a composer install. (Reference: https://packagist.org/packages/drupal/drupal)*. This will also add Drush and Drupal Console in the project.

3: Install Drupal.
*Go to http://localhost:8000 and complete the installation.*

## .env
The environment file contains credentials and version numbers for the Docker containers. This information is included both in the docker-compose.yml and the Makefile.

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
$ make db-import
```
*Import dumps/dump.sql to your database*

Export database
```
$ make db-export
```
*Export your database to dumps/dump.sql*

### Drush / Drupal Console
```
$ make drush <command>
```
```
$ make drupal <command>
```
