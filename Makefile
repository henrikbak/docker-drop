include .env

shell:
	docker-compose exec php bash

composer-install:
	docker-compose exec php composer install

composer-update:
	docker-compose exec php composer update

mysql-import:
	mkdir -p dumps
	docker-compose exec -T mysql mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) < dumps/dump.sql

mysql-dump:
	mkdir -p dumps
	docker-compose exec -T mysql mysqldump -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) --databases $(MYSQL_DATABASE) > dumps/dump.sql
