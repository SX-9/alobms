# Arch Linux Openbox Simple Setup
Run `install.sh` to setup automatically.
NOTE: This Script Is Made For Fresh New Systems.

Heres Also A Manual Install Guide:
```bash
# Install Required Packages

pacman -S openbox picom dunst tint2 conky rofi \
  pulseaudio nitrogen nodejs npm \
  network-manager-applet \
  lxappearance
yay -S pa-applet-git obmenu-generator

# Copy Config Files

cd ~
git clone https://github.com/SX-9/alobms .

# Start Openbox

startx
```