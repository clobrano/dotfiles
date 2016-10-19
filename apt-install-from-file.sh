#!/usr/bin/env bash
# Install all the package in the provided input file.
# The input file shall contain one package per line.

[ ! -f "$1" ] && echo "$1 is not a valid file" && exit 1

FILEPATH=$1
xargs -a <(awk '/^\s*[^#]/' "$FILEPATH") -r -- sudo apt-get install
