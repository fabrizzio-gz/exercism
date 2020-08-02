#!/usr/bin/env bash

main() {

    

    if [[ $# != 1 ]]
    then
        return 1
    fi

    # Handle special characters
    arg=`echo "$1" | tr "-" " " | tr "*" " "`
    # Conver to array separated by spaces
    words=( "$arg" )
    acronym=''

    for word in ${words[@]}
    do
        word=`echo "$word" | tr [:lower:] [:upper:] | tr -cd [:upper:]`
        acronym+=${word:0:1}
    done

    echo $acronym
}

main "$@"
