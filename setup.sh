#! /bin/bash

cp .env.example .env
docker exec lnk-app composer install --no-cache
docker exec lnk-app php artisan key:generate
docker exec lnk-app php artisan migrate
