#!/usr/bin/env bash

function brew_is_installed()
{
    local formula=$@

    brew ls --verbose "$formula" &> /dev/null

    return $?
}
