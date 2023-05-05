#!/bin/bash

mkdir $HOME/ascii_ZZA
cd $HOME/ascii_ZZA
echo -e "Create Directory \"ascii_ZZA\"  $(pwd)"

wget https://raw.githubusercontent.com/V70024/ZZA/master/ascii-zza.sh
chmod +x ascii-zza.sh
echo -e "Downloaded \"ascii-zza.sh\"  $(pwd)/ascii-zza.sh"

bashrc_runer="""
# --------------------------------------------------------

# To repeat the characters of the logo, to increase the width of the logo in a controlled manner, the characters that make up the logo are used repeatedly.
export CHARACTER_TO_MANY=2    # [1:░, 2:░░, 3:░░░, 4:░░░░, 5:░░░░ ...]

# Up to this character for use in logo writing
export CHARACTER_NUM=5        # [1: , 2:░, 3:▒, 4:▓, 5:█]

# up to this character for use in the mole parts of the logo
export NOT_CHARACTER_NUM=2    # [1: , 2:░, 3:▒, 4:▓, 5:█]

# The distance makes the upper part of the logo
export CLEAR_SCREEN_ON_START=true # [true or false]

# When the program finishes running, it clears the terminal screen 
export CLEAR_SCREEN_ON_END=false # [true or false]

#------------------
$(pwd)/ascii-zza.sh
# --------------------------------------------------------
"""

$padding_left = 0
while read -r line; do
    printf "%b\n"  "$line" ; sleep 0.07
    printf "%b\n"  "$line"  >> $HOME/.bashrc
done <<< "$bashrc_runer"

echo -e "\n\n\tThe installation was successful\n\n\t\t[Open a new terminal]\n\n\n\n"
