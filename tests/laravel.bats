#!/usr/bin/env bats

setup() {
    load test_helper.bash
    [ -d ~/repositories/exolnet-demo ] || skip "exolnet-demo not installed"

    cd ~/repositories/exolnet-demo
}

@test "update git repository" {
    git fetch origin
    git checkout develop
    git pull origin
}

@test "exo-php-initialize" {
    echo "" | exo-php-initialize
}

@test "create exolnet_demo_dev database" {
    mysql -u exolnet_dev -e 'CREATE DATABASE IF NOT EXISTS exolnet_demo_dev'
}

@test "composer install" {
    composer install
}

@test "yarn install" {
    yarn install
}

@test "generate .env" {
    cp -f .env.example .env
    sed -i '' 's/APP_NAME=.*/APP_NAME="Exolnet Demo"/g' .env
    sed -i '' 's/APP_URL=.*/APP_URL=exolnet_demo_dev/g' .env
    sed -i '' 's/DB_DATABASE=.*/DB_DATABASE=exolnet_demo_dev/g' .env
    sed -i '' 's/DB_USERNAME=.*/DB_USERNAME=exolnet_dev/g' .env
    sed -i '' 's/DB_PASSWORD=.*/DB_PASSWORD=/g' .env
}

@test "php artisan key:generate" {
    php artisan key:generate
}

@test "php artisan migrate" {
    php artisan migrate
}

@test "php artisan db:seed" {
    php artisan db:seed
}

@test "yarn production" {
    yarn production
}

@test "create symbolic link to ~/Sites" {
    ln -sfn $(realpath ./public) ~/Sites/exolnet-demo
}

@test "app is working" {
    run curl --verbose https://exolnet-demo.ssl.localhost/
    [ $status -eq 0 ]
}
