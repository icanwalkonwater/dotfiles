#!/bin/bash

count_update() {
    # yay -Sy >&/dev/null
    # echo $(yay -Qu | wc -l)
    expr $(checkupdates | wc -l) + $(checkupdates-aur | wc -l)
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
