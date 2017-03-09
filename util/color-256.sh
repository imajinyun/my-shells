#!/usr/bin/env bash
###############################################################################
# Command line prints different colors
#
# @file   color-256.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-15 12:56
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define variable and reset terminal
    terminal=$(tput sgr0)

    for fgbg in 38 48; do
        for color in {0..256}; do
            printf "\033[%s;5;%sm [%03s] \t" $fgbg $color $color
            echo -en "\033[0m"
            if [ $((($color + 1) % 10)) == 0 ]; then
                echo
            fi
        done
        echo
        echo
    done
fi

