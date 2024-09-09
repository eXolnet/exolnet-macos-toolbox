#!/usr/bin/env bats

setup() {
    load test_helper.bash
    brew_is_installed mailhog || skip "not installed"
}

@test "homebrew service is started" {
    run brew services list
    [ $status -eq 0 ]
    [[ $(echo "${lines[*]}" | grep mailhog) =~ "started" ]]
}

@test "mailhog is installed" {
    run curl --verbose https://mailhog.ssl.localhost/
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 200 OK" ]]
    [[ "${lines[*]}" =~ "<title>MailHog</title>" ]]
}
