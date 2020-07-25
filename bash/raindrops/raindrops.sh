#!/usr/bin/env bash

main()
{
    result=''
    if (( $# != 1 ))
    then
        return 1
    elif [[ $1 =~ ([0-9]) ]]
    then
	(( $(( $1 % 3 )) == 0 )) && result=${result}Pling
	(( $(( $1 % 5 )) == 0 )) && result=${result}Plang
	(( $(( $1 % 7 )) == 0 )) && result=${result}Plong
	[[ -z $result ]] && echo $1 || echo $result
    else
	return 1
    fi    
}

main "$@"
