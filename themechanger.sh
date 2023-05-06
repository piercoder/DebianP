#!/bin/bash

# Define the new color scheme
neutral="#abb2bf"
dark="#282c34"
light="#ffffff"
accent="#61afef"

# Current directory
wd=$(pwd)





# kitty
# Define the file path of the text file
file_path="$(pwd)/.config/kitty/kitty.conf"

# Foreground
start_text="foreground "
new_text="foreground $neutral"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Background
start_text="background "
new_text="background $dark"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Selection foreground
start_text="selection_foreground "
new_text="selection_foreground $dark"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Selection background
start_text="selection_background "
new_text="selection_background $accent"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Cursor
start_text="cursor "
new_text="cursor $accent"
sed -i "/^${start_text}/c${new_text}" ${file_path}





# dunst
# Define the file path of the text file
file_path="$(pwd)/.config/dunst/dunstrc"

# Frame color
start_text="frame_color = "
new_text="frame_color = \"$neutral\""
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute background color
start_text="background "
new_text="background = \"$dark\""
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute foreground color
start_text="foreground "
new_text="foreground = \"$neutral\""
sed -i "/^${start_text}/c${new_text}" ${file_path}





# dmenu style
# Define the file path of the text file
file_path="$(pwd)/.config/i3/dmenubin/style"

# Substitute the neutral color
start_text="neutral"
new_text="neutral=\"$neutral\""
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute the dark color
start_text="dark"
new_text="dark=\"$dark\""
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute the light color
start_text="light"
new_text="light=\"$light\""
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute the accent color
start_text="accent"
new_text="accent=\"$accent\""
sed -i "/^${start_text}/c${new_text}" ${file_path}





# i3 config file
# Define the file path of the text file
file_path="$(pwd)/.config/i3/config"

# Substitute the neutral color
start_text="set \$neutral"
new_text="set \$neutral $neutral"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute the dark color
start_text="set \$dark"
new_text="set \$dark $dark"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute the light color
start_text="set \$light"
new_text="set \$light $light"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute the accent color
start_text="set \$accent"
new_text="set \$accent $accent"
sed -i "/^${start_text}/c${new_text}" ${file_path}
