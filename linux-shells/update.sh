#!/bin/bash
###############################################################################
# CentOS software update script
#
# @file   update.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-17 09:44:29
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define colors
    C_DEFAULT="\033[1;31m []\033[m"
    C_WHITE="[\033[1m]"
    C_BLACK="[\033[30m]"
    C_RED="[\033[31m]"
    C_GREEN="[\033[32m]"

    C_YELLOW="\033[1;33m []\033[m"
    S_YELLOW="\033[33m"
    E_YELLOW="\033[m"

    # Define variable and reset terminal
    terminal=$(tput sgr0)

    # Install zsh
    myZsh="yum -y install zsh"
    echo -e "\n" $C_YELLOW "${S_YELLOW}Install zsh: ${E_YELLOW}" $myZsh
    $myZsh

    myGit="yum -y install git-all"
    echo -e "\n" $C_YELLOW "${S_YELLOW}Install git: ${E_YELLOW}" $myGit
    $myGit

    # Install oh-my-zsh
    myOhMyZsh="https://github.com/robbyrussell/oh-my-zsh"
    echo -e "\n" $C_YELLOW "${S_YELLOW}Install oh-my-zsh: ${E_YELLOW}" $myOhMyZsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # Install epel
    myEpel="yum -y install epel-release"
    echo -e "\n" $C_YELLOW "${S_YELLOW}Install epel-release: ${E_YELLOW}" $myEpel
    $myEpel

    # Install autojump
    myAutojump="yum -y install autojump autojump-zsh"
    echo -e "\n" $C_YELLOW "${S_YELLOW}Install autojump: ${E_YELLOW}" $myAutojump
    $myAutojump
    source /etc/profile.d/autojump.sh on startup

    # Install tools
    myTools="yum -y install htop tree ack dstat sl"
    echo -e "\n" $C_YELLOW "${S_YELLOW}Install autojump: ${E_YELLOW}" $myAutojump
    $myTools
fi

