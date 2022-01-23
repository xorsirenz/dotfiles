#!/bin/env bash
set -e 
# Madison's Arch + Dwm + Polybar dotfile rice installation script
# By me.. Madison!!
# License: GNU GPLv3

# Define colors because colors are pretty, duh!
RED=`tput bold && tput setaf 1`
CYAN=`tput bold && tput setaf 6`
NC=`tput sgr0`

function RED(){
  echo -e "\n${RED}${1}${NC}"
}
function CYAN(){
  echo -e "\n${CYAN}${1}${NC}"
}


CYAN "Madison's Arch (with dwm+polybar) install script, Hope you enjoy!"
sleep 2
CYAN "Updating the system.."
sudo pacman --noconfirm -Syu
exit 1
CYAN "Installing base system & needed packages for base install.."
sudo pacman --noconfirm -S base-devel git kitty wget xdg-utils xorg xorg-server xorg-xinit yajl zsh

CYAN "Installing Yay.."
git clone https://aur.archlinux.org/yay.git /opt/
cd /opt/yay-git && makepkg -si && cd ~/dotfiles/

CYAN "Installing polybar for dwm.."
yay --noconfirm -S polybar-dwm-module

CYAN "Installing ibhagwan picom fork.."
yay --noconfirm -S picom-ibhagwan-git

# installing fonts
sudo pacman --noconfirm -S noto-fonts noto-fonts-extra noto-fonts-cjk gsfonts nerd-fonts-complete 

# possible other needed fonts
# ttf-fira-code ttf-font-awesome ttf-jetbrains-mono

CYAN "Installing packages for the rice.."
sudo pacman --noconfirm -S dunst feh firefox jsoncpp lxappearance neofetch neovim nitrogen nodejs okular pavucontrol pulseaudio playerctl python-yaml ranger w3m zathura zathura-pdf-poppler

CYAN "Installing dotfiles"
mkdir -p ~/.config/
  if [ -d ~/.config/dunst ]; then
    CYAN "Dunst config already installed, backing up & installing new dunst config.."
    mkdir ~/.config/dunst.old && mv ~/.config/dunst/* ~/.config/dunst.old/
    cp -r ./dunst/.config/dunst/* ~/.config/dunst/;
  else
    CYAN "Installing dusnt config.."
    mkdir ~/.config/dunst && cp -r ./dunst/.config/dunst/* ~/.config/dunst;
  fi
  if [ -d ~/.config/kitty ]; then
    CYAN "Kitty config already installed, backing up & installing new kitty config.."
    mkdir ~/.config/kitty.old && mv ~/.config/kitty/* ~/.config/kitty.old/
    cp -r ./kitty/.config/kitty/* ~/.config/kitty/;
  else
    CYAN "Installing kitty config.."
    mkdir ~/.config/kitty && cp -r ./kitty/.config/kitty/* ~/.config/kitty;
  fi
  if [ -d ~/.config/neofetch ]; then
    CYAN "Neofetch config already installed, backing up & installing new neofetch config.."
    mkdir ~/.config/neofetch.old && mv ~/.config/neofetch/* ~/.config/neofetch.old/
    cp -r ./neofetch/.config/neofetch/* ~/.config/neofetch/;
  else
    CYAN "Installing neofetch config.."
    mkdir ~/.config/neofetch && cp -r ./neofetch/.config/neofetch/* ~/.config/neofetch;
  fi
  if [ -d ~/.config/nvim ]; then
    CYAN "Neovim config already installed, backing up & installing new neovim config.."
    mkdir ~/.config/nvim.old && mv ~/.config/nvim/* ~/.config/nvim.old/
    cp -r ./nvim/.config/nvim/* ~/.config/nvim/;
  else
    CYAN "Installing neovim config.."
    mkdir ~/.config/nvim/ && cp -r ./nvim/.config/nvim/* ~/.config/nvim/;
  fi
  if [ -d ~/.config/picom ]; then
    CYAN "Picom config already installed, backing up & installing new picom config.."
    mkdir ~/.config/picom.old && mv ~/.config/picom/* ~/.config/picom.old/
    cp -r ./picom/.config/picom/* ~/.config/picom/;
  else 
    CYAN "Installing picom config.."
    mkdir ~/.config/picom/ && cp -r ./picom/.config/picom/* ~/.config/picom/;
  fi
  if [ -d ~/.config/polybar ]; then
    CYAN  "Polybar config already installed, backing up & installing new polybar config.."
    mkdir ~/.config/polybar.old && mv ~/.config/polybar/* ~/.config/polybar.old/
    cp -r ./polybar/.config/polybar/* ~/.config/polybar/;
  else
    CYAN "Installing polybar config.."
    mkdir ~/.config/polybar/ && cp -r ./polybar/.config/polybar/* ~/.config/polybar/;
  fi
  if [ -d ~/.config/ranger/ ]; then
    CYAN "Ranger config already installed, backing up & installing new ranger config.."
    mkdir ~/.config/ranger.old && mv ~/.config/ranger/* ~/.config/ranger.old/
    cp -r ./ranger/.config/ranger/* ~/.config/ranger/;
  else
    CYAN "Installing ranger config"
    mkdir ~/.config/ranger/ && cp -r ./polybar/.config/polybar/* ~/.config/polybar/;
  fi
  if [ -d ~/.config/zathura/ ]; then
    CYAN "Zathura config already installed, backing up 7 installing new zathura config.."
    mkdir ~/.config/zathura.old && mv ~/.config/zathura/* ~/.config/zathura.old/
    cp -r ./zathura/.config/zathura/* ~/.config/zathura;
  else
    mkdir ~/.config/zathura/ && cp -r ./zathura/.config/zathura/* ~/.config/zathura/;
  fi
  if [ -d ~/Pictures/Wallpapers ]; then
    CYAN "Adding wallpaper to ~/Pictures/wallpapers"
    cp ./wallpapers/024.png ~/Pictures/wallpapers/;
  else
    CYAN "Installing wallpaper"
    cp ./wallpapers/024.png ~/Pictures/wallpapers/;
  fi
