# Defining colors
red='\e[0;31m';
gre='\e[0;32m';
yel='\e[1;33m';
blu='\e[1;34m';
whi='\e[0;37m';

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
    echo -e '${whi}Do you want to get info about ' + $issue + ' printed? (Y/n)'
    read -sn 1 answere
    
    if [[ "$answere" == "y" || "$answere" == "" ]]
    then
        sed -i -r 's/#$issue/$issue/g' $confile
    fi
done

# Get OS
echo -e "${blu}> Obtaining OS..."
os=$(cat /etc/os-release | grep -E '\bID='| tr "=" "\n" | grep -v ID)
echo -e "${gre}> Looks like you are using $os."
echo "os=$os" >> conf

# Set executer alias
echo -e "${blu}> Creating alias for execution..."
alias=$(echo "sh $(pwd)/laguntza.sh")
if [[ "$SHELL" == *zsh* ]]
then
    echo "alias laguntza=\"$alias\"" >> ~/.zshrc
    echo "$(red)run 'source ~/.zshrc' to restart shell configuration."
elif [[ "$SHELL" == *bash* ]]
then
    echo "alias laguntza=\"$alias\"" >> ~/.bashrc
    echo "$(red)run 'source ~/.bashrc' to restart shell configuration."
elif [[ "$SHELL" == *fish* ]]
then
#    function laguntza; $alias; end; && funcsave laguntza
fi

# Finished.
echo -e "${gre}> Succesfully finished. Try 'laguntza' after restarting shell configuration."
