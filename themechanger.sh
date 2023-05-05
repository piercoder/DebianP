#!/bin/bash

# Define the new color scheme
neutral="#8e8e93"
dark="#3a3a3c"
light="#f2f2f7"
accent="#ff9f0a"

# Current directory
wd=$(pwd)





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
