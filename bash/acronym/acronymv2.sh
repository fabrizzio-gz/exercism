#!/usr/bin/env bash

main() {
 
    IFS=', -_*'
    read -r -a words <<< "$1"
    acronym=''

    for word in "${words[@]}"
    do
        word=${word^^}
        acronym+=${word:0:1}
    done

    printf '%s\n' "$acronym"
    
}

main "$@"
