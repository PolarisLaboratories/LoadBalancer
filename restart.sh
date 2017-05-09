#!/bin/bash

if [ -f /run/nginx.pid ]
then
    sudo nginx -s stop
fi
sudo nginx
