#!/bin/bash

# Define the new color scheme
neutral="#8e8e93"
dark="#3a3a3c"
light="#f2f2f7"
accent="#409cff"

# Current directory
wd=$(pwd)

# kitty
# Define the file path of the text file
file_path="$(pwd)/.config/kitty/kitty.conf"

# Substitute background
start_text="background "
new_text="background $dark"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute foreground
start_text="foreground"
new_text="foreground $neutral"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute cursor
start_text="cursor"
new_text="cursor $accent"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute selection background
start_text="selection_background"
new_text="selection_background $accent"
sed -i "/^${start_text}/c${new_text}" ${file_path}

# Substitute selection foreground
start_text="selection_foreground"
new_text="selection_foreground $background"
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
