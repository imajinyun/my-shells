#!/bin/bash
###############################################################################
# CentOS system monitor
#
# @file   update.sh
# @author majinyun <imajinyun@gmail.com>
# @date   2017-01-15 12:16
###############################################################################

clear

if [[ $# -eq 0 ]]
then
    # Define variable and reset terminal
    terminal=$(tput sgr0)

    # Check OS type
    os=$(uname -o)
    echo -e "\e[1;33m[]" "OS type:" $terminal $os

    # Check OS release version and name
    os_name=$(cat /etc/issue | grep -e "Server")
    echo -e "\e[1;33m[]" "OS release version and name:" $terminal $os_name

    # Check architecture
    architecture=$(uname -m)
    echo -e "\e[1;33m[]" "OS architecture:" $terminal $architecture

    # Check kernel release
    kernel_release=$(uname -r)
    echo -e "\e[1;33m[]" "OS kernel release:" $terminal $kernel_release

    # Check hostname
    hostname=$(uname -n)
    echo -e "\e[1;33m[]" "OS hostname:" $terminal $hostname

    # Check internal ip
    internal_ip=$(hostname -I)
    echo -e "\e[1;33m[]" "OS internal ip:" $terminal $internal_ip

    # Check External ip
    external_ip=$(curl -s http://ipecho.net/plain)
    echo -e "\e[1;33m[]" "OS external ip:" $terminal $external_ip

    # Check DNS
    dns=$(cat /etc/resolv.conf | grep -E "\<nameserver[  ]+" | awk '{print $NF}')
    echo -e "\e[1;33m[]" "OS dns:" $terminal $dns

    # Check if connected to internet or not
    ping -c 3 baidu.com &>/dev/null && echo -e "\e[1;33m[]" "OS network status:" $terminal "Internet is connected" || echo "Internet is disconnected"

    # Check logged in users
    who>/tmp/who
    echo -e "\e[1;33m[]" "OS logged in users:" $terminal && cat /tmp/who
    rm -f /tmp/who

    # OS memory usages
    os_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
    echo -e "\e[1;33m[]" "OS memory usages:" $terminal $os_mem_usages

    # App memory usages
    app_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
    echo -e "\e[1;33m[]" "App memory usages:" $terminal $app_mem_usages

    # load averages
    loadaverages=$(top -n 1 -b | grep "load average" | awk '{print $12 $13 $14}')
    echo -e "\e[1;33m[]" "Load averages:" $terminal $loadaverages

    # Disk usages
    disk_usages=$(df -hP | grep -vE 'Filesystem|tmpfs' | awk '{print $1 " " $5}')
    echo -e "\e[1;33m[]" "Disk usages:" $terminal $disk_usages
fi
