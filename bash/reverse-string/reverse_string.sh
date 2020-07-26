#!/usr/bin/env bash

main()
{
    (( $# != 1 )) && return 1
    result=''
    string="$1"
    index=$((${#string}-1))
    while (( index >= 0 ))
    do
	result=${result}${string:index:1}
	index=$(($index-1))
    done
    echo "$result"
}

main "$@"
