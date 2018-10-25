# Docker Drop

A Docker development setup optimized for Drupal 7/8. It can be used for an existing Drupal website, or you can choose to use one of the kickstart commands to spin up a new Drupal website from scratch.

Shortcut aliases are available for a more efficient development workflow.

## Stack
|Image|Version|Port|
|---|---|---|
|Nginx|1.14|8000|
|PHP|7.1|-|
|MYSQL|5.7|3306|
|Mailhog|1.0.0|8025|

Version numbers are adjustable in the .env file.

## Tools
|Name|Version|
|---|---|
|Composer|Latest|
|Drush|8.1.17|
|Drupal Console|~1.0|

## Getting started:

### Existing site
1. Files: Place the files of the existing website in the **./web** folder.
2. Database: Place existing database by placing the sql-file in **./data/init** and adjust the db credentials in your settings file.
3. `$ docker-compose up -d`

### New site - Drupal 8
```
$ ./scripts/sc.sh drupal8-kickstart
```
This will build and install a new Drupal 8 website. It will install Composer, Drush and Drupal Console in the build process. The Composer setup is based on drupal/drupal project from packagist (https://packagist.org/packages/drupal/drupal).

### New site - Drupal 7
```
$ ./scripts/sc.sh drupal7-kickstart
```
This will install a new Drupal 7 website.

## Shortcuts (sc.sh)
The sc.sh file is intended to simplify the execution of commonly used commands. It's basically shortcuts for executing commands inside the Docker containers.

Tip: It's recommended to create an alias for '/.scripts/sc.sh' in your .bashrc or .bash_profile.

```
echo "alias sc='./scripts/sc.sh'" >> ~/.bashrc
```

### Composer, Drush and Drupal Console.
To execute these commands inside the Docker PHP container, just prefix with the 'sc' alias.

```
$ sc composer <command>
```
```
$ sc drush <command>
```
```
$ sc drupal <command>
```

### Database
Import database
```
$ sc import-db <path_to_file>
```
*Imports a sql file to the database.*

Export database
```
$ sc export-db
```
*Exports the current database to a sql file in the './data/db-dump' folder.*

## .env
The environment file contains credentials and version numbers for the Docker containers. This information is included both in the Dockerfile for PHP, the docker-compose.yml and the sc.sh.