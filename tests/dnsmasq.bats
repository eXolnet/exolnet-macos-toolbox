#!/usr/bin/env bats

setup() {
    load test_helper.bash
    brew_is_installed dnsmasq || skip "not installed"
}

@test "homebrew service is started" {
    run sudo brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep dnsmasq) =~ "started" ]]
}
