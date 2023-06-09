#!/bin/bash

# Characters 
CHAR_1=" "
CHAR_2="░"
CHAR_3="▒"
CHAR_4="▓"
CHAR_5="█"

# Up to this character for use in logo writing
if (( CHARACTER_NUM == 1 )); then CHARACTER=$CHAR_1
elif (( CHARACTER_NUM == 2 )); then CHARACTER=$CHAR_2
elif (( CHARACTER_NUM == 3 )); then CHARACTER=$CHAR_3
elif (( CHARACTER_NUM == 4 )); then CHARACTER=$CHAR_4
elif (( CHARACTER_NUM == 5 )); then CHARACTER=$CHAR_5
else  echo -e "Error [CHARACTER_NUM] \n\tThe \"CHARACTER_NUM\" variable can only take numbers between 1 and 5 \n(1: , 2:░, 3:▒, 4:▓, 5:█)" ; exit
fi

# up to this character for use in the mole parts of the logo
if (( NOT_CHARACTER_NUM == 1 )); then NOT_CHARACTER=$CHAR_1 
elif (( NOT_CHARACTER_NUM == 2 )); then NOT_CHARACTER=$CHAR_2
elif (( NOT_CHARACTER_NUM == 3 )); then NOT_CHARACTER=$CHAR_3
elif (( NOT_CHARACTER_NUM == 4 )); then NOT_CHARACTER=$CHAR_4
elif (( NOT_CHARACTER_NUM == 5 )); then NOT_CHARACTER=$CHAR_5
else  echo -e "Error [NOT_CHARACTER_NUM] \n\tThe \"NOT_CHARACTER_NUM\" variable can only take numbers between 1 and 5 \n(1: , 2:░, 3:▒, 4:▓, 5:█)" ; exit
fi

# To repeat the characters of the logo, to increase the width of the logo in a controlled manner, the characters that make up the logo are used repeatedly.
CHARACTER=$(printf "%0.s${CHARACTER}" $(seq 1 $CHARACTER_TO_MANY))
NOT_CHARACTER=$(printf "%0.s${NOT_CHARACTER}" $(seq 1 $CHARACTER_TO_MANY))

# The colors used in the logo design
NONE='\e[0m\e[5m'
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0;37m'

# Logo design
art="""${GREEN}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${WHITE}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${WHITE}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${GREEN}${CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${WHITE}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NONE}
${GREEN}${CHARACTER}${NONE}${NOT_CHARACTER}${WHITE}${CHARACTER}${NONE}${NOT_CHARACTER}${WHITE}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${RED}${CHARACTER}${NONE}${NOT_CHARACTER}${RED}${CHARACTER}${NONE}${NOT_CHARACTER}${RED}${CHARACTER}${NONE}
${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${WHITE}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${WHITE}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${RED}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NONE}
${WHITE}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${WHITE}${CHARACTER}${CHARACTER}${CHARACTER}${RED}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${RED}${CHARACTER}${NONE}
${WHITE}${CHARACTER}${NONE}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${NOT_CHARACTER}${RED}${CHARACTER}${NONE}
${WHITE}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${CHARACTER}${NONE}${NOT_CHARACTER}${RED}${CHARACTER}${CHARACTER}${NONE}\e[0m"""

# The coordinates that determine the logo to be placed in the center of the terminal
padding_top=$(( ($(tput lines) - 15) / 2 ))
padding_left=$(( ($(tput cols) - 25) / 2 ))

# When the program is executed, it clears the terminal screen
if [ "$CLEAR_SCREEN_ON_START" = true ]; then clear ; sleep 0.2
fi

# The distance makes the upper part of the logo
for ((i=1; i<=padding_top; i++)); do echo "" ; done

# Displays the logo with a space from the left so that the logo is centered on the terminal
while read -r line; do
    printf "%*s%b\n" $padding_left '' "$line" ; sleep 0.03
done <<< "$art"

# Space forms the final part of the logo
for ((i=0; i<=padding_top-1; i++)); do echo "" ; done

#When the program finishes running, it clears the terminal screen
if [ "$CLEAR_SCREEN_ON_END" = true ]; then sleep 1.5 ; clear
fi
