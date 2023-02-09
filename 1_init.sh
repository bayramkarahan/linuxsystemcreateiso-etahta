#!/bin/bash
#set -e
set -x
#### Check root
if [[ ! $UID -eq 0 ]] ; then
    echo -e "\033[31;1mYou must be root!\033[:0m"
    exit 1
fi
#### Remove all environmental variable
for e in $(env | sed "s/=.*//g") ; do
    unset "$e" &>/dev/null
done
#### Set environmental variables
export PATH=/bin:/usr/bin:/sbin:/usr/sbin
export LANG=C
export SHELL=/bin/bash
export TERM=linux
export DEBIAN_FRONTEND=noninteractive