#!/bin/bash

# Defining colors
red='\e[0;31m';
gre='\e[0;32m';
yel='\e[1;33m';
blu='\e[1;34m';
whi='\e[0;37m';

# Start execution
echo
echo -e "${yel}  Configuring laguntza${whi}"
echo

## Create directory in config
# Get current users name (for working directory)
cur_dir=$(pwd)
IFS='/'
read -ra USERPATH <<< "$cur_dir"
for i in 0 1 2 3 4
do
    if [[ $(echo "${USERPATH[i]}") == "home" ]]
    then
        user=$(echo "${USERPATH[($i)+1]}")
        break
    fi
done

# Create structure
if [[ ! -d /home/$user/.config/laguntza ]]
then
    mkdir -p /home/$user/.config/laguntza &&
    cp laguntza.sh /home/$user/.config/laguntza/laguntza.sh &&
    chmod +x /home/$user/.config/laguntza/laguntza.sh &&
    cp install.sh /home/$user/.config/laguntza/install.sh &&
    chmod +x /home/$user/.config/laguntza/install.sh &&
    cp conf /home/$user/.config/laguntza/conf
fi

# Defining variables
os_marked=0
issues=()
confile=$(echo "/home/$user/.config/laguntza/conf")
while IFS= read -r line; do
	issues+=("$line")
done < "$confile"

# Select needed help
echo -e "${blu}> Add your needed helps"
for issue in "${issues[@]}"
do
    if [[ $(cat /home/$user/.config/laguntza/laguntza.sh | grep os=) != "os=" ]]
    then
        os_marked=1
    fi

    echo -e "${whi}Do you want to get info about $issue printed? (Y/n)"
    read -sn 1 answere

    if [[ "$answere" == "y" || "$answere" == "" ]]
    then
        issu=$(echo $issue | cut -c2-)
        sed -i 's,#'"$issu"','"$issu"',' "$confile"
    else
        if [[ $(echo $issue | cut -c1) != "#" ]]
        then
           sed -i 's,'"$issue"',#'"$issue"',' "$confile"
        fi
    fi
done

# Get OS
echo -e "${blu}> Obtaining OS..."
os=$(cat /etc/os-release | grep -E '\bID='| tr "=" "\n" | grep -v ID)
echo -e "${gre}> Looks like you are using $os."
if [[ $os_marked -eq 0 ]]
then
    sed -i 's/os=/os=debian/g' /home/$user/.config/laguntza/laguntza.sh
fi

# Set executer alias and emulator
echo -e "${blu}> Creating alias for execution..."
user_sh=$(getent passwd $user | cut -d: -f7)
echo -e "${gre}> Looks like your default emulator is" $user_sh

alias=$(echo "/home/$user/.config/laguntza/laguntza.sh")
if [[ "$SHELL" == *zsh* ]]
then
    sed -i '/alias laguntza/d' /home/$user/.zshrc
    echo "alias laguntza=\"$alias\"" >> /home/$user/.zshrc
    echo -e "${red}run 'source ~/.zshrc' to restart shell configuration."
elif [[ "$SHELL" == *bash* ]]
then
    sed -i '/laguntza/d' /home/$user/.bashrc
    echo "alias laguntza=\"$alias\"" >> /home/$user/.bashrc
    echo -e "${red}run 'source ~/.bashrc' to restart shell configuration."
fi

# Finished.
echo -e "${yel}> Succesfully finished. Try 'laguntza' after restarting shell configuration.${whi}"
exit 1
