#!/usr/bin/env bash
###############################################################################
# Mac software install script
#
# @file   mac-install.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2016-11-18 12:59:00
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define variable and reset terminal
    terminal=$(tput sgr0)

    brew=($which brew)
    cask=($which brew cask)

    declare -A groups
    declare -a orders

    groups=(
        # Install quick look plugins
        [preview-plugin-install]="$cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo"
        [phpunit-install]="wget https://phar.phpunit.de/phpunit.phar && chmod +x phpunit.phar && sudo mv phpunit.phar /usr/local/bin/phpunit"
        [laravel-install]="composer global require 'laravel/installer'"
        [psysh-install]="composer g require 'psy/psysh:@stable'"
        [midnight-commander]="$brew install mc"
        [php-switcher-install]="$brew install brew-php-switcher"
        [php-install]="$brew install php70"
        [nginx-install]="$brew install nginx"
        [util]="$brew install unrar archey wget bash git curl sl htop tree autojump"
        [xmind]="$cask install xmind"
    )

    orders=(
        "preview-plugin-install"
        "phpunit-install"
        "laravel-install"
        "psysh-install"
        "midnight-commander"
        "php-switcher-install"
        "php-install"
        "nginx-install"
        "util"
        "xmind"
    )

    length=${#orders[@]}
    echo -e "\n\033[1;33;7m Array Length: \033[0m" $length

    for i in "${!orders[@]}"; do
        key=${orders[$i]}
        val=${groups[${orders[$i]}]}
        random=$(($RANDOM % 10 + 30))
        echo -e "\n\033[1;$random;7m $key: \033[0m" $val # && $val
    done
fi

