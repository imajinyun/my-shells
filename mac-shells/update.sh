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
        [composer-update]="$(which composer) self-update"
        [composer-global-update]="$(which composer) global update"
        [symfony-update]="$(which symfony) self-update"
        [phalcon-devtools-update]="`cd $HOME/.phalcon-devtools && git pull && cd ~`"
        [phpunit-version]="$(which phpunit) --check-version"
        [brew-doctor]="$(which brew) doctor"
        [brew-prune]="$(which brew) prune"
        [brew-update]="$(which brew) update"
        [autojump-purge]="$(which autojump) --purge"
        [gitbook-update]="$(which gitbook) update"
        [npm-outdated]="$(which npm) outdated -g --depth=0"
        [npm-global-update]="sudo $(which npm) update -g"
        [gem-global-update]="sudo $(which gem) update --system"
        [gem-update]="`gem outdated | cut -d ' ' -f 1`"
        [vim-update]="vim +BundleUpdate +qal"
        [system-information]="$(which archey) -p -o"
    )

    orders=(
        "composer-update"
        "composer-global-update"
        "symfony-update"
        "phalcon-devtools-update"
        "phpunit-version"
        "brew-doctor"
        "brew-prune"
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
        elif [ $key == "phalcon-devtools-update" ]; then
            echo -e "\n\033[1;$random;7m $key: \033[0m" $val
        elif [ $key == "gem-update" ]; then
            echo -e "\n\033[1;$random;7m $key: \033[0m" "sudo gem update $val" && sudo gem update $val
        else
            echo -e "\n\033[1;$random;7m $key: \033[0m" $val #&& $val
        fi
    done
fi

