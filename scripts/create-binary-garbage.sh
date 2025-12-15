#!/usr/bin/env bash

# requires bash >= 4.0
# echo $BASH_VERSION
declare -A args

# output_file=$(uuidgen | tr -d '-')
# dd if=/dev/urandom of=$output_file bs=10M count=1

generate_filename() {
    echo $(uuidgen | tr -d '-')
}

script_main() {
    # dd if=/dev/urandom of=$1 bs=$2 count=1
    echo "script_main"
}

# TODO: catch when flag value not provided
#       - processing args; len: 1, [-o]
#       ./create-binary-garbage.sh: option requires an argument -- o  <== CATCH THIS?!?
#       unknown flag 
#       - - of: 

process_args() {
    echo "- processing args; len: $#, [$@]"
    args['_ALL']=$*
    while getopts "o:s:c:" flag;
    do
        case $flag in 
            o) args[of]=$OPTARG ;;
            s) args[bs]=$OPTARG ;;
            c) args[count]=$OPTARG ;;
            \?) echo "unknown flag $OPTARG" ;;
        esac
    done

    echo "- - of: ${args[of]}"
    echo "- - bs: ${args[bs]}"
    echo "- -  c: ${args[count]}"


    echo "- - substituting defaults appropriately"
    if [[ -z ${args[of]} ]]; then
        args[of]=$(generate_filename)
    fi
