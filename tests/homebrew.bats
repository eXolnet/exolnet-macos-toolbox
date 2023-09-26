#!/usr/bin/env bats

@test "homebrew is installed" {
    run brew list
    [ $status -eq 0 ]
}

@test "homebrew services are available" {
    run brew services list
    [ $status -eq 0 ]
}

@test "homebrew administrator services are available" {
    run sudo brew services list
    [ $status -eq 0 ]
}
