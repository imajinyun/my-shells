#!/usr/bin/env bash
###############################################################################
# In order to update some of the tools of the system library to write the shell
#
# @file   update.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-15 12:14
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define colors

    # Define variable and reset terminal
    terminal=$(tput sgr0)

    # Check OS type
    type="$(uname -s)"
    echo -e "\n" $C_YELLOW "${S_YELLOW}OS type: ${E_YELLOW}" $type

    # Check OS architecture
    architecture=$(uname -m)
    echo -e "\n" $C_YELLOW "${S_YELLOW}OS architecture: ${E_YELLOW}" $architecture
fi

