#!/bin/bash

if ping -q -c1 -l1 8.8.8.8 >/dev/null; then
    expr $(checkupdates | wc -l) + $(checkupdates-aur | wc -l)
else
    echo 'Offline'
fi
