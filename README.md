# Docker Drop

A Docker development setup optimized for Drupal 8.

## Development stack
- Nginx
- PHP 7
- Mysql

## Features
- Composer
- Drupal Console Launcher

## Getting started:
```
$ docker-compose up -d
```

## Downloading Drupal:
```
$ docker-compose exec php composer create-project drupal/drupal .
```

This will download the latest version of Drupal to the web folder and run a composer install.

Go to http://localhost:8080 and go through the installation.