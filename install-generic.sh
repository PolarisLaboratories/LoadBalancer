#!/bin/bash

if [ $# -lt 2 ]
then
    echo $#
    echo "Usage: ./install-generic.sh <operating system> <prefix>"
    exit 1
fi

DIR=$1
PREFIX=$2
SUDO=$3

$SUDO cp -p $DIR/nginx.conf "$PREFIX"etc/nginx/
$SUDO cp -p server.crt "$PREFIX"etc/nginx/
$SUDO cp -p server.key "$PREFIX"etc/nginx/
