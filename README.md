# Docker Drop

A Docker development setup optimized for Drupal 8. Includes a kickstart command to spin up a new Drupal 8 website from scratch. Shortcut aliases are available for a better development workflow.

## Stack
|Container|Version|Port|
|---|---|---|
|Nginx|1.14|8000
|PHP|7.1.15|-
|MYSQL|5.7|3306

## Tools
|Name|Version|
|---|---|
|Composer|Latest|
|Drupal Console|~1.0|
|Drush|~9.0|
|Mailhog|0.1.9|

## Getting started:
To get up and running all you need to do is execute the following command.

```
$ ./scripts/sc.sh drupal-kickstart
```

This will build and install a whole new Drupal 8 website from scratch. It will install Composer, Drush and Drupal Console in the build process. The Composer setup is based on drupal/drupal project from packagist (https://packagist.org/packages/drupal/drupal).

The website will be accessible on http://localhost:8000 once the install has finished.

## sc.sh - shortcuts
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
$ sc db-import
```
*Import dumps/import/import.sql to the database.*

Export database
```
$ sc db-export
```
*Exports the current database to the dumps/export folder.*

## .env
The environment file contains credentials and version numbers for the Docker containers. This information is included both in the docker-compose.yml and the do.sh.