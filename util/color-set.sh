#!/usr/bin/env bash
###############################################################################
# Define color variable
#
# @file   colors.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-15 10:58
###############################################################################

clear

if [[ $# -eq 0 ]]; then
    # Reset
    Color_Off='\033[0m'       # Text Reset

    # Regular Colors
    Black='\033[0;30m'        # Black
    Red='\033[0;31m'          # Red
    Green='\033[0;32m'        # Green
    Yellow='\033[0;33m'       # Yellow
    Blue='\033[0;34m'         # Blue
    Magenta='\033[0;35m'      # Magenta
    Cyan='\033[0;36m'         # Cyan
    White='\033[0;37m'        # White

    # Bold
    BBlack='\033[1;30m'       # Black
    BRed='\033[1;31m'         # Red
    BGreen='\033[1;32m'       # Green
    BYellow='\033[1;33m'      # Yellow
    BBlue='\033[1;34m'        # Blue
    BMagenta='\033[1;35m'     # Magenta
    BCyan='\033[1;36m'        # Cyan
    BWhite='\033[1;37m'       # White

    # Underline
    UBlack='\033[4;30m'       # Black
    URed='\033[4;31m'         # Red
    UGreen='\033[4;32m'       # Green
    UYellow='\033[4;33m'      # Yellow
    UBlue='\033[4;34m'        # Blue
    UMagenta='\033[4;35m'     # Magenta
    UCyan='\033[4;36m'        # Cyan
    UWhite='\033[4;37m'       # White

    # Background
    On_Black='\033[40m'       # Black
    On_Red='\033[41m'         # Red
    On_Green='\033[42m'       # Green
    On_Yellow='\033[43m'      # Yellow
    On_Blue='\033[44m'        # Blue
    On_Magenta='\033[45m'     # Magenta
    On_Cyan='\033[46m'        # Cyan
    On_White='\033[47m'       # White

    # High Intensity
    IBlack='\033[0;90m'       # Black
    IRed='\033[0;91m'         # Red
    IGreen='\033[0;92m'       # Green
    IYellow='\033[0;93m'      # Yellow
    IBlue='\033[0;94m'        # Blue
    IMagenta='\033[0;95m'     # Magenta
    ICyan='\033[0;96m'        # Cyan
    IWhite='\033[0;97m'       # White

    # Bold High Intensity
    BIBlack='\033[1;90m'      # Black
    BIRed='\033[1;91m'        # Red
    BIGreen='\033[1;92m'      # Green
    BIYellow='\033[1;93m'     # Yellow
    BIBlue='\033[1;94m'       # Blue
    BIMagenta='\033[1;95m'    # Magenta
    BICyan='\033[1;96m'       # Cyan
    BIWhite='\033[1;97m'      # White

    # High Intensity backgrounds
    On_IBlack='\033[0;100m'   # Black
    On_IRed='\033[0;101m'     # Red
    On_IGreen='\033[0;102m'   # Green
    On_IYellow='\033[0;103m'  # Yellow
    On_IBlue='\033[0;104m'    # Blue
    On_IMagenta='\033[0;105m' # Magenta
    On_ICyan='\033[0;106m'    # Cyan
    On_IWhite='\033[0;107m'   # White

    # Define variable and reset terminal
    terminal=$(tput sgr0)

    declare -A groups
    declare -a orders

    groups=(
        [black]="${Black}这是黑色显示效果${Color_Off}"
        [red]="${Red}这是红色显示效果${Color_Off}"
        [green]="${Green}这是绿色显示效果${Color_Off}"
        [yellow]="${Yellow}这是黄色显示效果${Color_Off}"
        [blue]="${Blue}这是蓝色显示效果${Color_Off}"
        [magenta]="${Purple}这是洋红显示效果${Color_Off}"
        [cyan]="${Cyan}这是青色显示效果${Color_Off}"
        [white]="${White}这是白色显示效果${Color_Off}"
        [bold-black]="${BBlack}这是黑色加粗显示效果${Color_Off}"
        [bold-red]="${BRed}这是红色加粗显示效果${Color_Off}"
        [bold-green]="${BGreen}这是绿色加粗显示效果${Color_Off}"
        [bold-yellow]="${BYellow}这是黄色加粗显示效果${Color_Off}"
        [bold-blue]="${BBlue}这是蓝色加粗显示效果${Color_Off}"
        [bold-magenta]="${BMagenta}这是洋红加粗显示效果${Color_Off}"
        [bold-cyan]="${BCyan}这是青色加粗显示效果${Color_Off}"
        [bold-white]="${BWhite}这是白色加粗显示效果${Color_Off}"
        [on-black]="${On_Black}这是黑色背景色${Color_Off}"
        [on-red]="${On_Red}这是红色背景色${Color_Off}"
        [on-green]="${On_Green}这是绿色背景色${Color_Off}"
        [on-yellow]="${On_Yellow}这是黄色背景色${Color_Off}"
        [on-blue]="${On_Blue}这是蓝色背景色${Color_Off}"
        [on-magenta]="${On_Magenta}这是洋红背景色${Color_Off}"
        [on-cyan]="${On_Cyan}这是青色背景色${Color_Off}"
        [on-white]="${On_White}这是白色背景色${Color_Off}"
    )

    orders=(
        "black"
        "red"
        "green"
        "yellow"
        "blue"
        "magenta"
        "cyan"
        "white"
        "bold-black"
        "bold-red"
        "bold-green"
        "bold-yellow"
        "bold-blue"
        "bold-magenta"
        "bold-cyan"
        "bold-white"
        "on-black"
        "on-red"
        "on-green"
        "on-yellow"
        "on-blue"
        "on-magenta"
        "on-cyan"
        "on-white"
    )

    length=${#orders[@]}
    echo -e "\n" $BYellow"array length: " $length $Color_Off

    for i in "${!orders[@]}"; do
        key=${orders[$i]}
        val=${groups[${orders[$i]}]}
        echo -e "\n" "$key: $val"
    done
fi

