include .env

bash:
	@docker-compose exec php bash

drupal-kickstart:
	@docker-compose exec php rm -f .gitkeep
	@docker-compose exec php composer create-project drupal/drupal .
	@docker-compose exec php composer require drupal/console:$(CONSOLE_VERSION) --prefer-dist --optimize-autoloader
	@docker-compose exec php composer require drush/drush:$(DRUSH_VERSION)

ifeq (composer,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

composer: 
	@docker-compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

db-import:
	@mkdir -p dumps
	@docker-compose exec -T mysql mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) < dumps/dump.sql

db-export:
	@mkdir -p dumps
	@docker-compose exec -T mysql mysqldump -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) --databases $(MYSQL_DATABASE) > dumps/dump.sql

drush:
	@docker-compose exec php drush $(filter-out $@,$(MAKECMDGOALS))

drupal:
	@docker-compose exec php drupal $(filter-out $@,$(MAKECMDGOALS))