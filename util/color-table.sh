#!/usr/bin/env bash
###############################################################################
# Command line prints different colors
#
# @file   colors.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-15 09:41
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define variable and reset terminal
    terminal=$(tput sgr0)

    for style in 0 1 2 3 4 5 6 7; do
        printf "ESC[%s;Foreground;Background] - \n" $style
        for fg in 30 31 32 33 34 35 36 37; do
            for bg in 40 41 42 43 44 45 46 47; do
                printf "\033[%s;%s;%sm [%02s;%02s;%02s] " $style $fg $bg $style $fg $bg
                echo -en "\033[0m"
            done
            echo
        done
        echo -e "\033[0m"
    done
fi

