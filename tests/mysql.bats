#!/usr/bin/env bats

setup() {
    load test_helper.bash
    brew_is_installed mysql || skip "not installed"
}

@test "homebrew service is started" {
    run brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep mysql) =~ "started" ]]
}

@test "mysql database is running" {
    run mysqladmin ping
    [ $status -eq 0 ]
}

@test "mysql databases are available" {
    run mysql -e 'SHOW DATABASES'
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "information_schema" ]]
    [[ "${lines[*]}" =~ "mysql" ]]
    [[ "${lines[*]}" =~ "performance_schema" ]]
    [[ "${lines[*]}" =~ "sys" ]]
}

@test "mysql users are created" {
    run mysql -e 'SELECT user FROM mysql.user'
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "exolnet" ]]
    [[ "${lines[*]}" =~ "exolnet_dev" ]]
    [[ "${lines[*]}" =~ "exolnet_local" ]]
    [[ "${lines[*]}" =~ "exolnet_prev" ]]
    [[ "${lines[*]}" =~ "exolnet_prod" ]]
    [[ "${lines[*]}" =~ "exolnet_qa" ]]
    [[ "${lines[*]}" =~ "exolnet_test" ]]
}
