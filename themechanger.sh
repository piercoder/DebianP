#!/bin/bash

# Define the new color scheme
neutral="#abb2bf"
dark="#282c34"
light="#ffffff"
accent="#61afef"

# Define file paths and corresponding sed commands
declare -A files=(
    ["$(pwd)/.config/kitty/kitty.conf"]="s/^foreground.*/foreground $neutral/;s/^background\s.*/background $dark/;s/^selection_foreground.*/selection_foreground $dark/;s/^selection_background.*/selection_background $accent/;s/^cursor.*/cursor $accent/"
    ["$(pwd)/.config/dunst/dunstrc"]="s/^frame_color.*/frame_color = \"$neutral\"/;s/^background\s.*/background = \"$dark\"/;s/^foreground.*/foreground = \"$neutral\"/"
    ["$(pwd)/.config/i3/dmenubin/style"]="s/^neutral.*/neutral=\"$neutral\"/;s/^dark.*/dark=\"$dark\"/;s/^light.*/light=\"$light\"/;s/^accent.*/accent=\"$accent\"/"
    ["$(pwd)/.config/i3/config"]="s/^set \$neutral.*/set \$neutral $neutral/;s/^set \$dark.*/set \$dark $dark/;s/^set \$light.*/set \$light $light/;s/^set \$accent.*/set \$accent $accent/"
)

# Loop through the files and sed commands to make changes
for file in "${!files[@]}"; do
    sed -i -e "${files[$file]}" "$file"
done
