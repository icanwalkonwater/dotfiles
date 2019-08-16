#!/bin/bash

cmd="$(command -v playerctl) -p spotify"
if [[ $? -ne 0 ]]; then
	echo 'Playerctl not found !'
	exit 1
fi

if pgrep -x spotify >/dev/null; then
	# Previous
	echo -n "%{A1:$cmd previous:}%{A} "

	# Play/pause
	echo -n "%{A1:$cmd play-pause:}"
	if [[ $(playerctl $opt status) = 'Playing' ]]; then
		echo -n ''
	else
		echo -n ''
	fi
	echo -n "%{A} "

	# Next
	echo -n "%{A1:$cmd next:}%{A} "
	$cmd metadata -f '{{ artist }} - {{ title }}'
else
	echo "%{A1:i3-msg exec --no-startup-id spotify:} Spotify%{A}"
fi
