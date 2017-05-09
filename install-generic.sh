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

if $SUDO test -f "/etc/letsencrypt/live/paladin.polarislabs.io/fullchain.pem"
then
    echo "LetsEncrypt cert detected. Symlinking into $PRERFIX/etc/nginx"
    $SUDO rm "$PREFIX"etc/nginx/server.crt 2&> /dev/null
    $SUDO rm "$PREFIX"etc/nginx/server.key 2&> /dev/null
    $SUDO ln -s /etc/letsencrypt/live/paladin.polarislabs.io/fullchain.pem "$PREFIX"etc/nginx/server.crt
    $SUDO ln -s /etc/letsencrypt/live/paladin.polarislabs.io/privkey.pem "$PREFIX"etc/nginx/server.key
else
    echo "LetsEncrypt cert NOT detected. Installing self-signed certs"
    $SUDO cp -p server.crt "$PREFIX"etc/nginx/
    $SUDO cp -p server.key "$PREFIX"etc/nginx/
fi
