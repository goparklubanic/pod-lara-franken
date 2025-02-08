# PODMAN LARAVEL FRANKENPHP

Podman container orchestration of laravel app using octane served by frankenphp, mariadb database management system and phpmyadmin database web ui

## SETUP LARAVEL AND OCTANE
Assume the name of laravel project is pod-lara-franken.
1. `composer create-project laravel/laravel pod-lara-franken`
2. `cd pod-lara-franken`
3. `composer require laravel/octane`
4. `php artisan octane:install`

Frankenphp package is not available for Ms Windows yet, then you can install it from inside the container. 

Optional step, creating .dockerignore file
`cat .gitignore > .dockerignore`


## CLONE THIS REPOSITORY
Clone this repository in order to get podman-compose.yml and Dockerfile. Modify all parameters in podman-compose.yml. You can also rename this file to docker-compose.yml if you use docker.

## MODIFY .env FILE
- DB_CONNECTION=mysql
- DB_HOST=dbm               # the same as database service name in podman-compose.yml
- DB_PORT=3306
- DB_DATABASE=your_db       # the same as database username in podman-compose.yml
- DB_USERNAME=your_user     # the same as database username in podman-compose.yml
- DB_PASSWORD=your_password # the same as database password in podman-compose.yml

## BUILD AND RUN THE CONTAINER
`podman-compose up -d --build`