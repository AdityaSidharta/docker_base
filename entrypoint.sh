#!/usr/bin/env bash

set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

if [[ $# != 1 ]]
then
    echo "Number of arguments supplied is wrong"
    exit 1
fi

if [[ $1 == 'start' ]]
then
    bash bin/start.sh
elif [[ $1 == 'init' ]]
then
    bash bin/init.sh
elif [[ $1 == 'test' ]]
then
    bash bin/test.sh
elif [[ $1 == 'debug' ]]
then
    tail -f /dev/null
else
    echo "The argument is not valid, only the following [init, start, test, debug] is accepted"
    exit 1
fi