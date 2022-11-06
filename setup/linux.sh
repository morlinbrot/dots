#!/bin/sh

exit_msg="\nPlease provide the name of the package manager you want to use as first argument.
Currently, \"apt\" and \"pacman\" are supported."

if [ -z "$1" ]
then
    echo $exit_msg
    return
else
    if [ $1 == "apt" ]
    then
        install_cmd="$1 install -y"
        bin/ubuntu.sh
    elif [ $1 == "pacman" ]
    then
        install_cmd="$1 -Sy"
    else
        echo $exit_msg
        return
    fi
fi

# xargs will pipe the contents of the file into the supplied command as arguments.
eval "cat apps.txt | xargs sudo $install_cmd"
