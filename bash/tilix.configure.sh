#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
## Helper script to save and load tilix configuration
## Usage tilix.configure.sh [options]
## option
##     -l, --load        Load configuration file
##     -s, --save        Save configuration file
##     -f, --file <path> Path to file where save or from where load configuration [default: ./tilix.conf]
# GENERATED_CODE: start
# Default values
_file=./tilix.conf

# No-arguments is not allowed
[ $# -eq 0 ] && sed -ne 's/^## \(.*\)/\1/p' $0 && exit 1

# Converting long-options into short ones
for arg in "$@"; do
  shift
  case "$arg" in
"--load") set -- "$@" "-l";;
"--save") set -- "$@" "-s";;
"--file") set -- "$@" "-f";;
  *) set -- "$@" "$arg"
  esac
done

function print_illegal() {
    echo Unexpected flag in command line \"$@\"
}

# Parsing flags and arguments
while getopts 'hlsf:' OPT; do
    case $OPT in
        h) sed -ne 's/^## \(.*\)/\1/p' $0
           exit 1 ;;
        l) _load=1 ;;
        s) _save=1 ;;
        f) _file=$OPTARG ;;
        \?) print_illegal $@ >&2;
            echo "---"
            sed -ne 's/^## \(.*\)/\1/p' $0
            exit 1
            ;;
    esac
done
# GENERATED_CODE: end

[ $_save ] &&  set -x; dconf dump /com/gexperts/Tilix/ > "$_file"; set +x
[ $_load ] &&  set -x; dconf load /com/gexperts/Tilix/ < "$_file"
