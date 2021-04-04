#!/bin/bash
clear

## VARIABLES
os=manjaro
yel='\e[1;33m';
blu='\e[1;34m';
whi='\e[0;37m';
config=~/.config/laguntza/conf
cnf=$(cat $config)

## FLAGS
if [[ "$@" == *-conf* ]]
then
    sh ~/.config/laguntza/install.sh
    exit 0
fi

## ECHO PROGRAM
echo
echo    "    __                                       __                            "
echo    "   |  \                                     |  \                           "
echo    "   | ▓▓ ______   ______  __    __ _______  _| ▓▓_   ________  ______       "
echo    "   | ▓▓|      \ /      \|  \  |  \       \|   ▓▓ \ |        \|      \      "
echo    "   | ▓▓ \▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓  | ▓▓ ▓▓▓▓▓▓▓\\▓▓▓▓▓▓  \▓▓▓▓▓▓▓▓ \▓▓▓▓▓▓\     "
echo    "   | ▓▓/      ▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓ | ▓▓ __  /    ▓▓ /      ▓▓     "
echo    "   | ▓▓  ▓▓▓▓▓▓▓ ▓▓__| ▓▓ ▓▓__/ ▓▓ ▓▓  | ▓▓ | ▓▓|  \/  ▓▓▓▓_|  ▓▓▓▓▓▓▓     "
echo    "   | ▓▓\▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓ ▓▓  | ▓▓  \▓▓  ▓▓  ▓▓    \\▓▓    ▓▓     "
echo    "    \▓▓ \▓▓▓▓▓▓▓_\▓▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓   \▓▓▓▓ \▓▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓    "
echo    "               |  \__| ▓▓                                                  "
echo    "                \▓▓    ▓▓                                                  "
echo    "                 \▓▓▓▓▓▓                                                   "
echo

if [[ "$cnf" == *update_and_upgrade* && "$cnf" != *#update_and_upgrade* ]]
then
    echo -e "  > ${yel}System status${whi}"
    if [[ "$os" == "manjaro" || "$os" == "arch" ]]
    then
        echo -e "     ${blu}· Update:       ${whi}sudo pacman -Syy"
        echo -e "     ${blu}· Upgrade:      ${whi}sudo pacman -Su"
    elif [[ $os == "ubuntu" || $os == "debian" ]]
    then
        echo -e "     ${blu}· Update:       ${whi}sudo apt get update"
        echo -e "     ${blu}· Upgrade:      ${whi}sudo apt get upgrade"
    elif [[ $os == "fedora" ]]
    then
        echo -e "     ${blu}· Update:       ${whi}sudo dnf update"
        echo -e "     ${blu}· Upgrade:      ${whi}sudo dnf upgrade"
    fi
    echo
fi
if [[ "$cnf" == *i3_configuration* && "$cnf" != *#i3_configuration* ]]
then
    echo -e "  > ${yel}i3 configuration${whi}"
    echo -e "     ${blu}· config:       ${whi}nano .config/i3/config"
    echo -e "     ${blu}· i3bar:        ${whi}nano .config/i3/status.toml"
    echo -e "     ${blu}· restart:      ${whi}i3-msg reload && i3-msg restart"
    echo
fi
if [[ "$cnf" == *extracting* && "$cnf" != *#extracting* ]]
then
    echo -e "  > ${yel}Extract file${whi}"
    echo -e "     ${blu}· tar:          ${whi}tar xvf file.tar"
    echo -e "     ${blu}· zip:          ${whi}unzip file.zip (-d /target/path/)"
    echo -e "     ${blu}· 7z:           ${whi}7z x file.7z"
    echo -e "     ${blu}· rar:          ${whi}unrar x file.rar folder/"
    echo
fi
if [[ "$cnf" == *creating_extract_file* && "$cnf" != *#creating_extract_file* ]]
then
    echo -e "  > ${yel}Crete exctracted file${whi}"
    echo -e "     ${blu}· tar:          ${whi}tar cvf file.tar folder/ (file.jon folder2/ folder3/ ...)"
    echo -e "     ${blu}· zip:          ${whi}zip -r file.zip folder/"
    echo -e "     ${blu}· 7z:           ${whi}7za a file.7z file.ex (file2.ex file3.ex ...)"
    echo -e "     ${blu}· rar:          ${whi}rar a file.rar folder/"
    echo
fi
if [[ "$cnf" == *install_programs* && "$cnf" != *#install_programs* ]]
then
    echo -e "  > ${yel}New programs${whi}"
    echo -e "     ${blu}· AUR:          ${whi}git clone aur-repo.git"
    echo -e "                     cd aur-repo"
    echo -e "                     makepkg -si"
    echo -e "     ${blu}· Pacman:       ${whi}sudo pacman -S package"
    echo
fi
if [[ "$cnf" == *git* && "$cnf" != *#git* ]]
then
     echo -e "  > ${yel}Git${whi}"
     echo -e "     ${blu}· Clone:       ${whi}git clone repo.git"
     echo -e "     ${blu}· New:         ${whi}git init"
     echo -e "     ${blu}· Pull:        ${whi}git pull"
     echo -e "     ${blu}· Add files:   ${whi}git add file.1 file.2"
     echo -e "     ${blu}· Commit:      ${whi}git commit -m 'message'"
     echo -e "     ${blu}· Push chgs:   ${whi}git push origin master"
    echo
fi
if [[ "$cnf" == *alias* && "$cnf" != *#alias* ]]
then
    echo -e "  > ${yel}Create new alias${whi}"
    echo -e "     ${whi}echo alias name=com >> ~/.zshrc && source ~/.zshrc"
    echo
fi
exit 0
