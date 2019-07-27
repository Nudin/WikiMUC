#!/bin/bash
HOST=gern
PORT=3142
if nc -w1 -z $HOST $PORT; then
    echo -n "http://${HOST}:${PORT}"
else
    echo -n "DIRECT"
fi
