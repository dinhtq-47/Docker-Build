start:
	- UID=$(id -u) GID=$(id -g) && docker-compose up -d
	- docker-compose run npm run watch
stop:
	- docker-compose stop
config:
	- docker-compose run php php artisan config:cache
autoload:
	- docker-compose run composer dump-autoload
migrate:
	- docker-compose run php php artisan migrate
migrate-refresh:
	- docker-compose run php php artisan migrate:refresh
migrate-rollback:
	- docker-compose run php php artisan migrate:rollback		
php:
	- docker-compose exec php sh
install:
	- sudo docker-compose up -d
	- sudo docker-compose run npm run prod
	- sudo docker-compose run php php artisan migrate
	- sudo docker-compose run php php artisan db:seed

