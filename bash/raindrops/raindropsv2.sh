#!/usr/bin/env bash

main()
{
    result=''
    if [[ $# -ne 1 || "$1" != +([1-9])*([0-9]) ]]
    then
        return 1
    else
	(( $(( $1 % 3 )) == 0 )) && result+=Pling
	(( $(( $1 % 5 )) == 0 )) && result+=Plang
	(( $(( $1 % 7 )) == 0 )) && result+=Plong
	[[ -z $result ]] && echo $1 || echo $result
    fi    
}

main "$@"
