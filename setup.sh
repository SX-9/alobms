#! /bin/bash

clear
echo -e "\e[36m { Arch Linux Openbox Minimal Setup } \e[0m"

echo -e "\e[32m [a] \e[0m Installing Software..."
echo -e "\e[34m [i] \e[0m Recommended: xfce4-terminal thunar falkon vlc leafpad pavucontrol"
echo -e "\e[33m [p] \e[0m Install Recommended Apps? (y/N)"
read prompt1

if [[ ${prompt1,,} == "y" ]]; then
	echo -e "\e[34m [i] \e[0m Yes Selected"
	sleep 1
	sudo -p " [p]  Input Password: " pacman -S xfce4-terminal thunar falkon vlc leafpad pavucontrol neofetch --noconfirm
	sleep 5
	if [[ $? != 0 ]]; then
		echo -e "\e[31m [e] \e0m Error Detected!"
		exit
	fi
else
	echo -e "\e[34m [i] \e[0m No Selected"
	sleep 5
fi

where yay
if [[ $? != 0 ]]; then
	echo -e "\e[32m [a] \e[0m Installing Openbox..."
	sudo -p " [p]  Input Password: " yay -S openbox obconf xorg xorg-xinit xorg-drivers nitrogen tint2 conky rofi pulseaudio npm nodejs pa-applet-git obmenu-generator --noconfirm 
else
	echo -e "\e[31m [e] \e0m Error Detected!"
	exit
fi

echo -e "\e[32m [a] \e[0m Copying Config Files..."
sleep 5
sudo -p " [p]  Input Password: " cp ./config-files/b.config/* ~/.config/.
sudo -p " [p]  Input Password: " cp ./config-files/b.local/* ~/.local/.
sudo -p " [p]  Input Password: " cp ./config-files/b.xinitrc ~/.xinitrc

if [[ $? == 0 ]]; then
	echo -e "\e[31m [e] \e[0m Error Detected!"
	exit
fi

echo -e "\e[34m [i] \e[0m Installation Completed, Run \"startx\" (From tty1) To Launch Openbox"
echo -e "\e[33m [p] \e[0m Start Openbox Now? (Y/n)"
read prompt2

if [[ ${prompt2,,} == "n"]]; then
	sleep 2
	startx
fi

# EOF