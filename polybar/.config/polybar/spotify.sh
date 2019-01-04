#!/bin/bash

display_status() {
	player_output=$(playerctl --player=spotify status)
	if [ "$player_output" != "No players found" ]; then
		playerctl --player=spotify metadata --format "{{ artist }} - {{ title }}"
	else
		echo ""
	fi
}

player_toggle_play() {
	playerctl --player=spotify play-pause
}

case "$1" in
	"--toggle")
		player_toggle_play
		;;
	"--status" | *)
		display_status
		;;
esac