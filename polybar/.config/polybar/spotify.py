#!/usr/bin/python

import gi
import sys

gi.require_version('Playerctl', '2.0')

from gi.repository import Playerctl

FORMAT_CONTROL = '%%{A1:playerctl --player=spotify previous:}%%{A} ' \
                 '%%{A1:playerctl --player=spotify play-pause:}%s%%{A} ' \
                 '%%{A1:playerctl --player=spotify next:} %%{A}'
FORMAT_TITLE = '%s - %s'

player = Playerctl.Player()

player_name = player.get_property('player-name')
status = player.get_property('status')

if not player_name == 'spotify':
    print("")
    exit(1)

print(FORMAT_CONTROL % ('' if not status == 'Playing' else ''), end="")
print(FORMAT_TITLE % (player.get_title(), player.get_artist()))
