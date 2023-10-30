#!/usr/bin/env bats

setup() {
    load test_helper.bash
}

@test "php 8.0 is installed" {
    brew_is_installed php@8.0 || skip "not installed"

    run brew services list
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "php@8.0 started" ]]

    run curl --verbose https://php80.ssl.localhost/
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 200 OK" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-imagick.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-pcov.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-redis.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-xdebug.ini" ]]
}

@test "php 8.1 is installed" {
    brew_is_installed php@8.1 || skip "not installed"

    run brew services list
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "php@8.1 started" ]]

    run curl --verbose https://php80.ssl.localhost/
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 200 OK" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-imagick.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-pcov.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-redis.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-xdebug.ini" ]]
}

@test "php 8.2 is installed" {
    brew_is_installed php || skip "not installed"

    run brew services list
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "php     started" ]]

    run curl --verbose https://php80.ssl.localhost/
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 200 OK" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-imagick.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-pcov.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-redis.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-xdebug.ini" ]]
}

@test "exo-php-extension returns available extensions" {
    run exo-php-extension
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "imagick" ]]
    [[ "${lines[*]}" =~ "pcov" ]]
    [[ "${lines[*]}" =~ "redis" ]]
    [[ "${lines[*]}" =~ "xdebug" ]]
}