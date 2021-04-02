# Defining colors
red='\e[0;31m';
gre='\e[0;32m';
yel='\e[1;33m';
blu='\e[1;34m';
whi='\e[0;37m';
os_marked=0

# Defining variables
confile='conf'
issues=$(cat $confile)

# Start execution
echo
echo -e "${yel}  Installing laguntza   "
echo

# Select needed help
echo -e "${blu}> Add your needed helps"
for issue in $issues
do
    if [[ $(echo $issue | cut -c1-2) != "os" ]]
    then
        echo -e "${whi}Do you want to get info about" $issue "printed? (Y/n)"
        read -sn 1 answere

        if [[ "$answere" == "y" || "$answere" == "" ]]
        then
            issu=$(echo $issue | cut -c2-)
            sed -i 's,#'"$issu"','"$issu"',' conf
        else
            if [[ $(echo $issue | cut -c1) != "#" ]]
            then
                sed -i 's,'"$issue"',#'"$issue"',' conf        
            fi
        fi
    else
        os_marked=1
    fi
done

# Get OS
echo -e "${blu}> Obtaining OS..."
os=$(cat /etc/os-release | grep -E '\bID='| tr "=" "\n" | grep -v ID)
echo -e "${gre}> Looks like you are using $os."
if [[ os_marked -eq 0 ]]
then
    echo "os=$os" >> conf
fi

# Set executer alias
echo -e "${blu}> Creating alias for execution..."
echo -e "${gre}> Looks like your are using" $SHELL "emulator"

alias=$(echo "sh $(pwd)/laguntza.sh")
if [[ "$SHELL" == *zsh* ]]
then
    echo "alias laguntza=\"$alias\"" >> ~/.zshrc
    echo -e "${red}run 'source ~/.zshrc' to restart shell configuration."
elif [[ "$SHELL" == *bash* ]]
then
    echo "alias laguntza=\"$alias\"" >> ~/.bashrc
    echo -e "${red}run 'source ~/.bashrc' to restart shell configuration."
#elif [[ "$SHELL" == *fish* ]]
#then
#    echo function laguntza; $alias; end; && funcsave laguntza
fi

# Finished.
echo -e "${yel}> Succesfully finished. Try 'laguntza' after restarting shell configuration."
exit 0
