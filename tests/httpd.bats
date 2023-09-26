setup() {
    load test_helper.bash
    brew_is_installed httpd || skip "not installed"
}

@test "homebrew service is started" {
    run sudo brew services list
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "httpd   started" ]]
}

@test "apache server is installed" {
    run curl --verbose http://localhost
    [ $status -eq 0 ]
    [[ "${lines[*]}" =~ "< HTTP/1.1 301 Moved Permanently" ]]
    [[ "${lines[*]}" =~ "< Location: https://ssl.localhost/" ]]
}
