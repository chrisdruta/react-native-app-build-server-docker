#!/bin/bash

localpath="**YOUR LOCAL PATH FOR DEBUG PURPOSES**"
serverpath="/usr/apps/"

if [ "$1" = "l" ] || [ "$1" = "L" ]
then
    docker run \
        -it -p 5000:5000 \
        -v $localpath/app:/usr/apps/mobile-app \
        -v $localpath/server:/usr/apps/web-app \
        app
else
    docker run \
        -p 5000:5000 \
        -v $serverpath/app:/usr/apps/mobile-app \
        -v $serverpath/server:/usr/apps/web-app \
        app
fi
