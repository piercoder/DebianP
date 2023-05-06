#!/bin/bash

# This script toggles between vertical and horizontal split in i3 window manager

# Get the current split orientation
current_orientation=$(i3-msg -t get_tree | jq -r '.nodes[1].orientation')

# Toggle the orientation
if [ "$current_orientation" == "horizontal" ]; then
    i3-msg "split v"
else
    i3-msg "split h"
fi
