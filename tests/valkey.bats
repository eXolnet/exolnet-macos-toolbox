#!/usr/bin/env bats

setup() {
    load test_helper.bash
    brew_is_installed valkey || skip "not installed"
}

@test "homebrew service is started" {
    run brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep valkey) =~ "started" ]]
}

@test "valkey is running" {
    run valkey-cli --scan
    [ $status -eq 0 ]
}
