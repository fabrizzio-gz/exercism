#!/usr/bin/env bash

main()
{
    if (( $# != 2 )) || [[ "$1" != *([ACGT?]) ]] || [[ "$2" != *([ACGT?]) ]] 
    then
        echo "Usage: hamming.sh <string1> <string2>"
        return 1
    fi

    # Changing '?' with 'X'
    strandA=${1//[?]/X}
    strandB=${2//[?]/X}
    
    if (( "${#strandA}" != "${#strandB}" ))
    then
        echo "left and right strands must be of equal length"
        return 1
    else
        difference=0
        for (( i=0; i<"${#strandA}"; i++ ))
        do
            [[ ${strandA:$i:1} != ${strandB:$i:1} ]] && ((difference+=1))
        done
        echo "$difference"
        return 0
    fi
}
 
main "$@"

