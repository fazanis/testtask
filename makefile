
container_php       = workspace
container_db        = mysql
container_server    = webserver

#############################################
###                                       ###
###   MakeFile for Laravel Crash Course   ###
###                                       ###
#############################################

composer_dep: #install composer dependency >> ./vendors
	@docker run --rm -v $(CURDIR):/app composer install

laravel_install: #Create new Laravel project
	@docker-compose exec $(container_php) composer create-project --prefer-dist laravel/laravel app

key: #generate APP key
	@docker-compose exec $(container_php) php artisan key:generate

ownership: #Set ownership
	@sudo chown $(USER):$(USER) . -R

#####################################
###                               ###
###       Work in containers      ###
###                               ###
#####################################

start: #start docker containers @docker-compose up -d
	@cd ../laradock && sudo docker-compose up -d nginx mysql phpmyadmin workspace

stop: #stop docker containers
	@cd ../laradock && sudo docker-compose down

show: #show docker's containers
	@cd ../laradock && sudo docker ps

ssh: #Connect to APP container
	@cd ../laradock && sudo docker-compose exec $(container_php) bash

artisan:
	@cd ../laradock && docker-compose exec $(container_php) bash php artisan migrate

connect_db: #Connect to DB container
	@cd ../laradock && docker-compose exec $(container_db) bash

connect_server: #Connect to container_server container
	@cd ../laradock && docker-compose exec $(container_server) /bin/sh
