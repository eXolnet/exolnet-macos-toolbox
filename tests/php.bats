#!/usr/bin/env bats

setup() {
    load test_helper.bash
}

@test "php 8.1 is installed" {
    brew_is_installed php@8.1 || skip "not installed"

    run brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep php@8.1) =~ "started" ]]

    run curl --verbose https://php81.ssl.localhost/
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 200 OK" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-imagick.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-pcov.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-redis.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-xdebug.ini" ]]
}

@test "php 8.2 is installed" {
    brew_is_installed php@8.2 || skip "not installed"

    run brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep php@8.2) =~ "started" ]]

    run curl --verbose https://php82.ssl.localhost/
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 200 OK" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-imagick.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-pcov.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-redis.ini" ]]
    [[ "${lines[*]}" =~ "exolnet-ext-xdebug.ini" ]]
}

@test "php 8.3 is installed" {
    brew_is_installed php || skip "not installed"

    run brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep "php ") =~ "started" ]]

    run curl --verbose https://php83.ssl.localhost/
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
