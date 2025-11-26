#!/usr/bin/env bash

function lsprogs(){
    echo $PATH | sed 's/\:/\n/g' > /tmp/current_shell.list
    diff ~/default_shell_programs.list /tmp/current_shell.list | cut -d'-' -f2 | tail -n +2
}
