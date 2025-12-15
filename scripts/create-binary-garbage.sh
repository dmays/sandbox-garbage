#!/usr/bin/env bash

# requires bash >= 4.0
# echo $BASH_VERSION
declare -A args

DEFAULT_BS="10k"
DEFAULT_COUNT=1


generate_filename() {
    echo $(uuidgen | tr -d '-')
}


script_main() {
    # echo "script_main of=${args[of]} bs=${args[bs]} count=${args[count]}"
    # dd if=/dev/urandom of=${args[of]} bs={args[bs]} count=${args[count]}
    echo "Created ${args[of]}"
}


# sets values in global `args` for use elsewhere
process_args() {
    # echo "- processing args; len: $#, [$@]"
    # echo "- - args: ${args[@]}"

    # args['_ALL']="<<$*>>"
    while getopts "o:s:c:" flag;
    do
        case $flag in 
            o) args[of]=$OPTARG ;;
            s) args[bs]=$OPTARG ;;
            c) args[count]=$OPTARG ;;
            \?) echo "unknown flag $OPTARG"; exit 1 ;;
        esac
    done

    # echo "- - of: ${args[of]}"
    # echo "- - bs: ${args[bs]}"
    # echo "- -  c: ${args[count]}"
    # echo "- args: ${args[@]}"


    echo "- - substituting defaults appropriately"
    # TODO: better output here would be nice. these are really debug/dev logs
    if [[ -z ${args[of]} ]]; then
        args[of]=$(generate_filename)
        echo "- - default of: ${args[of]}"
    fi
    if [[ -z ${args[bs]} ]]; then
        args[bs]=$DEFAULT_BS
        echo "- - default bs: ${args[bs]}"
    fi
    if [[ -z ${args[count]} ]]; then
        args[count]=$DEFAULT_COUNT
        echo "- - default count: ${args[count]}"
    fi
    # echo "- - args: ${args[@]}"
    # echo "- finished processing args"
}


process_args $@
script_main ${args[@]}

