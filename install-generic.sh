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

if [[ $DEV -eq 1 ]]
then
    WEBSITE="dev.paladin.polarislabs.io"
else
    WEBSITE="paladin.polarislabs.io"
fi

$SUDO cp -p $DIR/nginx.conf "$PREFIX"etc/nginx/

if $SUDO test -f "/etc/letsencrypt/live/$WEBSITE/fullchain.pem"
then
    echo "LetsEncrypt cert detected. Symlinking into $PRERFIX/etc/nginx"
    $SUDO rm "$PREFIX"etc/nginx/server.crt 2&> /dev/null
    $SUDO rm "$PREFIX"etc/nginx/server.key 2&> /dev/null

    $SUDO ln -s /etc/letsencrypt/live/$WEBSITE/fullchain.pem "$PREFIX"etc/nginx/server.crt
    $SUDO ln -s /etc/letsencrypt/live/$WEBSITE/privkey.pem "$PREFIX"etc/nginx/server.key
else
    echo "LetsEncrypt cert NOT detected. Installing self-signed certs"
    $SUDO cp -p server.crt "$PREFIX"etc/nginx/
    $SUDO cp -p server.key "$PREFIX"etc/nginx/
fi

$SUDO chmod 600 "$PREFIX"etc/nginx/server.{crt,key}
