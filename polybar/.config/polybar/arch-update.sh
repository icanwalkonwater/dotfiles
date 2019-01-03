#!/bin/bash

count_update() {
    yay -Sy >&/dev/null
    echo $(yay -Qu | wc -l)
}

update() {
    kitty yay -Syu
}

case "$1" in
    "--update")
        update
        ;;
    "--display" | *)
        count_update
        ;;
esac
