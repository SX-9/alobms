#! /bin/bash

pacman -S openbox picom dunst tint2 conky rofi \
  pulseaudio nitrogen nodejs npm \
  network-manager-applet \
  lxappearance
yay -S pa-applet-git obmenu-generator

cd ~
git clone https://github.com/SX-9/alobms .

startx