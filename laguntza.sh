clear
horia='\e[1;33m';
urdin='\e[1;34m';
txuri='\e[0;37m';
echo
echo "                          ~~~~~~~~~~~~~~~~~~~"
echo "                          | BETIKO LAGUNTZA |"
echo "                          ~~~~~~~~~~~~~~~~~~~"
echo
echo -e "  > ${horia}Sistema eguneratu${txuri}"
echo -e "     ${urdin}· Update:       ${txuri}sudo pacman -Syy"
echo -e "     ${urdin}· Upgrade:      ${txuri}sudo pacman -Su"
echo
echo -e "  > ${horia}i3 aldaketak${txuri}"
echo -e "     ${urdin}· config:       ${txuri}nano .config/i3/config"
echo -e "     ${urdin}· i3bar:        ${txuri}nano .config/i3/status.toml"
echo -e "     ${urdin}· berritu:      ${txuri}i3-msg reload && i3-msg restart"
echo
echo -e "  > ${horia}Extrakzioak atera${txuri}"
echo -e "     ${urdin}· tar:          ${txuri}tar xvf file.tar"
echo -e "     ${urdin}· zip:          ${txuri}unzip file.zip (-d /target/path/)"
echo -e "     ${urdin}· 7z:           ${txuri}7z x file.7z"
echo -e "     ${urdin}· rar:          ${txuri}unrar x file.rar folder/"
echo
echo -e "  > ${horia}Extrakzioak sortu${txuri}"
echo -e "     ${urdin}· tar:          ${txuri}tar cvf file.tar folder/ (file.jon folder2/ folder3/ ...)"
echo -e "     ${urdin}· zip:          ${txuri}zip -r file.zip folder/"
echo -e "     ${urdin}· 7z:           ${txuri}7za a file.7z file.jon (file2.jon file3.jon ...)"
echo -e "     ${urdin}· rar:          ${txuri}rar a file.rar folder/"
echo
echo -e "  > ${horia}Programa berriak${txuri}"
echo -e "     ${urdin}· AUR:          ${txuri}git clone aur-repo.git"
echo -e "                     cd aur-repo"
echo -e "                     makepkg -si"
echo -e "     ${urdin}· Pacman:       ${txuri}sudo pacman -S package.jon"
echo
echo -e "  > ${horia}Aliasak gehitu${txuri}"
echo -e "     ${txuri}echo alias izena=com >> ~/.zshrc && source ~/.zshrc"
echo
