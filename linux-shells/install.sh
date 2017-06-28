#!/bin/bash
###############################################################################
# CentOS software install script
#
# @file   install.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2016-11-18 12:59:00
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define variable and reset terminal
    terminal=$(tput sgr0)

    declare -A groups
    declare -a orders

    groups=(
        [epel]="yum -y install epel-release"
        [zsh]="yum -y install zsh"
        [git-all]="yum -y install git-all"
        [oh-my-zsh]=`printf "%s %s \"%s%s\"" "sh" "-c" "$" "(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
        [autojump]="yum -y install autojump autojump-zsh && source /etc/profile.d/autojump.sh on startup"
        [util]="yum -y install htop tree ack dstat sl"
    )

    orders=(
        "epel"
        "zsh"
        "git-all"
        "oh-my-zsh"
        "autojump"
        "util"
    )

    length=${#orders[@]}
    echo -e "\n\033[1;33;7m Array Length: \033[0m" $length

    for i in "${!orders[@]}"; do
        key=${orders[$i]}
        val=${groups[${orders[$i]}]}
        random=$(($RANDOM % 10 + 30))
        if [ $key == "oh-my-zsh" ]; then
            echo -e "\n\033[1;$random;7m $key: \033[0m" $val && eval $val
        else
            echo -e "\n\033[1;$random;7m $key: \033[0m" $val # && $val
        fi
    done
fi
