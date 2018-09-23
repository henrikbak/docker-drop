#!/bin/bash
source .env

function bash {
  docker-compose exec php bash
}

function composer {
  docker-compose exec php composer $@
}

function drush {
  docker-compose exec php drush $@
}

function drupal {
  docker-compose exec php drupal $@
}

function db-import {
  FILE="dumps/import/import.sql"
  if [ -f $FILE ]
  then
    docker-compose exec -T mysql mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < $FILE
  else
    echo "$FILE was not found"
  fi
}

function db-export {
  mkdir -p dumps/export
  DATE=`date +%Y%m%d-%H%M`
  FILE="dumps/export/export-$DATE.sql"
  docker-compose exec -T mysql mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD --databases $MYSQL_DATABASE > $FILE
  echo "Database was exported to $FILE"
}

function drupal-kickstart {
  docker-compose up -d
  docker-compose exec php rm -f .gitkeep
  docker-compose exec php composer create-project drupal/drupal .
  docker-compose exec php composer require drupal/console:$CONSOLE_VERSION --prefer-dist --optimize-autoloader
  docker-compose exec php composer require drush/drush:$DRUSH_VERSION
  docker-compose exec php drush si --db-url=mysql://$MYSQL_USER:$MYSQL_PASSWORD@mysql:3306/$MYSQL_DATABASE --site-name="Docker Drop" -y
  open "http://localhost:8000"
}

$*