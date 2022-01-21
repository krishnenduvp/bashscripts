#!/bin/bash
[ -z $# ] && { echo "No arguments passed" ; exit 1; }
echo "Script name : $0 "
echo "PID of process: $$"
echo "Exit status if last command: $?"
echo "The process of last background command: $!"
echo "Number of arg passed: $#"
echo "1st parameter = $1 "
echo "Last argument = "${@: -1}""
echo "Using *, prints all arg"
for i in "$*"
do
        echo  "$i"
done
echo "Using @, arg are individually double quoted"
for i in "$@"
do
        echo  "$i"
done

