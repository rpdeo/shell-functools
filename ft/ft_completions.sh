#!/bin/bash
# bash completion for shell-functools

ft_functions="$(ft-functions | sed -E 's/\[[0-9]+m//g' | cut -f1 -d' ')"

function _complete_ft() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-h --help -c --column"

    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    else
        COMPREPLY=( $(compgen -W "${ft_functions}" -- ${cur}) )
        return 0
    fi
}
complete -F _complete_ft map
complete -F _complete_ft filter
complete -F _complete_ft foldl
