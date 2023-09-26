#!/usr/bin/env bats

setup() {
    load test_helper.bash
    brew_is_installed redis || skip "not installed"
}

@test "homebrew service is started" {
    run brew services list
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "redis   started" ]]
}

@test "redis is running" {
    run redis-cli --scan
    [ $status -eq 0 ]
}
