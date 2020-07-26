#!/usr/bin/env bash

main()
{
    if [[ $# != 1 || "$1" != +([1-9])*([0-9]) ]]
    then
        echo "Usage: leap.sh <year>"
        return 1
    fi
    (( $(( $1 % 4)) == 0 && ($(( $1 % 100 )) != 0  || $(( $1 %400)) == 0)  )) && echo "true" || echo "false"
}

main "$@"
