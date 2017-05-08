#!/usr/bin/env bash
###############################################################################
# Mac software update script
#
# @file   update.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-14 12:38:35
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Define variable and reset terminal
    terminal=$(tput sgr0)

    declare -A groups
    declare -a orders

    groups=(
        [composer-version]="$(which composer) --version"
        [composer-global-update]="$(which composer) global update"
        [symfony-update]="$(which symfony) self-update -f"
        [atom-update]="$(which apm) update"
        [phpunit-version]="$(which phpunit) --check-version"
        [brew-update]="$(which brew) update"
        [autojump-purge]="$(which autojump) --purge"
        [gitbook-update]="$(which gitbook) update"
        [npm-outdated]="$(which npm) outdated -g --depth=0"
        [npm-global-update]="$(which npm) update -g"
        [gem-global-update]="sudo $(which gem) update --system"
        [gem-update]="`gem outdated | cut -d ' ' -f 1`"
        [vim-update]="vim +BundleUpdate +qal"
        [system-information]="$(which archey) -p -o"
    )

    orders=(
        "composer-version"
        "composer-global-update"
        "symfony-update"
        "atom-update"
        "phpunit-version"
        "brew-update"
        "autojump-purge"
        "gitbook-update"
        "npm-outdated"
        "npm-global-update"
        "gem-global-update"
        "gem-update"
        "vim-update"
        "system-information"
    )

    length=${#orders[@]}

    for i in "${!orders[@]}"; do
        key=${orders[$i]}
        val=${groups[${orders[$i]}]}
        random=$((RANDOM % 10 + 30))

        if [ $key == "gitbook-update" ]; then
            gitbook_version=`gitbook ls-remote | grep latest | awk '{print $3}'`
            if [ $gitbook_version == '3.2.2' ]; then
                echo -e "\n\033[1;$random;7m $key: \033[0m" "no new version\n" && $(which gitbook) --version
            else
                echo -e "\n\033[1;$random;7m $key: \033[0m" $val && $val
            fi
        elif [ $key == "brew-update" ]; then
            brew=$(which brew)
            $brew doctor
            $brew prune
            echo -e "\n\033[1;$random;7m $key: \033[0m" $val && $val
            $brew upgrade
            $brew cleanup
        elif [ $key == "gem-update" ]; then
            echo -e "\n\033[1;$random;7m $key: \033[0m" "sudo gem update $val" && sudo gem update $val
        else
            echo -e "\n\033[1;$random;7m $key: \033[0m" $val && $val
        fi
    done
fi

