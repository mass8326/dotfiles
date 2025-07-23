#!/usr/bin/env python3

import gi
import sys
import os
import json
import re
import array as arr

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

def resolveIconPath(iconName):
    iconTheme = Gtk.IconTheme.get_default()
    iconFile = iconTheme.lookup_icon(iconName.lower(), 32, 0)
    if iconFile:
        return iconFile.get_filename()
    else:
        return ""


windows = json.loads(os.popen("hyprctl -j clients").read())
filtered_windows = list(filter(lambda w: w["workspace"]["id"] != -1, windows))
mapped_windows = list(map(lambda w: "%s (%s) [%s]"%(w["class"], w["title"], w["address"]), filtered_windows))

print(mapped_windows)

joined_windows = "\n".join(mapped_windows)
selected_window = os.popen("echo \"%s\" | rofi -dmenu -show-icons"%(joined_windows)).read()

print("selected_window: %s"%(selected_window))

if (selected_window):
    match = re.search(r"\[(\w+)\]$", selected_window)
    addr = match.group(1)
    os.system("hyprctl dispatch focuswindow address:%s"%(addr))
else:
    print("no selected_window")
