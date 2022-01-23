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

# Script turned off until testing is finished
CYAN "This script is turned off until testing is completed."
CYAN "If you wish to run this script anyways, open up this file in a text editor and remove line 25: exit 1, and it should run."
exit 1


sleep 1

CYAN "Updating the system.."
sudo pacman --noconfirm -Syu

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
sudo pacman --noconfirm -S breeze-icons dunst feh firefox jsoncpp lxappearance neofetch neovim nitrogen nodejs okular pavucontrol pulseaudio playerctl python-yaml ranger w3m zathura zathura-pdf-poppler

CYAN "Installing dotfiles"
mkdir -p ~/.config/
  if [ -d ~/.config/dunst ]; then
    CYAN "Backing up & installing new dunst config.."
    mkdir ~/.config/dunst.old && mv ~/.config/dunst/* ~/.config/dunst.old/
    cp -r ./dunst/.config/dunst/* ~/.config/dunst/;
  else
    CYAN "Installing dusnt config.."
    mkdir ~/.config/dunst && cp -r ./dunst/.config/dunst/* ~/.config/dunst;
  fi
  if [ -d ~/.config/kitty ]; then
    CYAN "Backing up & installing new kitty config.."
    mkdir ~/.config/kitty.old && mv ~/.config/kitty/* ~/.config/kitty.old/
    cp -r ./kitty/.config/kitty/* ~/.config/kitty/;
  else
    CYAN "Installing kitty config.."
    mkdir ~/.config/kitty && cp -r ./kitty/.config/kitty/* ~/.config/kitty;
  fi
  if [ -d ~/.config/neofetch ]; then
    CYAN "Backing up & installing new neofetch config.."
    mkdir ~/.config/neofetch.old && mv ~/.config/neofetch/* ~/.config/neofetch.old/
    cp -r ./neofetch/.config/neofetch/* ~/.config/neofetch/;
  else
    CYAN "Installing neofetch config.."
    mkdir ~/.config/neofetch && cp -r ./neofetch/.config/neofetch/* ~/.config/neofetch;
  fi
  if [ -d ~/.config/nvim ]; then
    CYAN "Backing up & installing new neovim config.."
    mkdir ~/.config/nvim.old && mv ~/.config/nvim/* ~/.config/nvim.old/
    cp -r ./nvim/.config/nvim/* ~/.config/nvim/;
  else
    CYAN "Installing neovim config.."
    mkdir ~/.config/nvim/ && cp -r ./nvim/.config/nvim/* ~/.config/nvim/;
  fi
  if [ -d ~/.config/picom ]; then
    CYAN "Backing up & installing new picom config.."
    mkdir ~/.config/picom.old && mv ~/.config/picom/* ~/.config/picom.old/
    cp -r ./picom/.config/picom/* ~/.config/picom/;
  else 
    CYAN "Installing picom config.."
    mkdir ~/.config/picom/ && cp -r ./picom/.config/picom/* ~/.config/picom/;
  fi
  if [ -d ~/.config/polybar ]; then
    CYAN  "Backing up & installing new polybar config.."
    mkdir ~/.config/polybar.old && mv ~/.config/polybar/* ~/.config/polybar.old/
    cp -r ./polybar/.config/polybar/* ~/.config/polybar/;
  else
    CYAN "Installing polybar config.."
    mkdir ~/.config/polybar/ && cp -r ./polybar/.config/polybar/* ~/.config/polybar/;
  fi
  if [ -d ~/.config/ranger/ ]; then
    CYAN "Backing up & installing new ranger config.."
    mkdir ~/.config/ranger.old && mv ~/.config/ranger/* ~/.config/ranger.old/
    cp -r ./ranger/.config/ranger/* ~/.config/ranger/;
  else
    CYAN "Installing ranger config.."
    mkdir ~/.config/ranger/ && cp -r ./polybar/.config/polybar/* ~/.config/polybar/;
  fi
  if [ -d ~/.config/zathura/ ]; then
    CYAN "Backing up & installing new zathura config.."
    mkdir ~/.config/zathura.old && mv ~/.config/zathura/* ~/.config/zathura.old/
    cp -r ./zathura/.config/zathura/* ~/.config/zathura;
  else
    mkdir ~/.config/zathura/ && cp -r ./zathura/.config/zathura/* ~/.config/zathura/;
  fi
  if [ -d ~/Pictures/Wallpapers ]; then
    CYAN "Adding wallpaper to ~/Pictures/wallpapers.."
    cp ./wallpapers/024.png ~/Pictures/wallpapers/;
  else
    CYAN "Installing wallpaper to ~/Pictures/wallpapers/ directory.."
    mkdir ~/Pictures/wallpapers/ && cp ./wallpapers/024.png ~/Pictures/wallpapers/;
  fi
  if [ -f ~/.xinitrc ]; then
    CYAN "Backing up & installing new .xinitrc config.."
    cp ./.xinitrc ~/.xinitrc.bak && cp .xinitrc ~/;
  else
    cp ./.xinitrc ~/;
  fi
  if [ -f ~/.aliases ~/ ]; then
    CYAN "Backing up & installing new .aliases file.."
    cp ./.aliases ~/.aliases.bak;
  else
    cp ./.aliases ~/;
  fi
  if [ -f ~/.bashrc ]; then
    CYAN "Backing up & installing new .bashrc config.."
    cp ~/.bashrc ~/.bashrc.bak && cp ./bash/.bashrc ~/;
  else
    cp ./bash/.bashrc ~/.bashrc;
  fi
  if [ -f ~/.bash_profile ]; then
    CYAN "Backing up & installing new .bash_profile config.."
    cp ~/.bash_profile ~/.bash_profile.bak && cp ./bash/.bash_profile ~/;
  else
    cp ./bash/.bash_profile ~/;
  fi
  if [ -f ~/.zshrc ]; then
    CYAN "Backing up & installing new .zshrc config.."
    cp ~/.zshrc ~/.zshrc.bak && cp ./zsh/.zshrc ~/;
  else
    cp ./zsh/.zshrc ~/;
  fi
  if [ -f ~/.zprofile ]; then
    CYAN "Backing up & installing new .zprofile config.."
    cp ~/.zprofile ~/.zprofile.bak && cp ./zsh/.zprofile ~/;
  else
    cp ./zsh/.zprofile ~/;
  fi
  if [ -d ~/.config/zsh/plugins/ ]; then
    CYAN "Installing zsh-autosugdotfilegestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/;
  else
    mkdir ~/.config/zsh/plugins/ && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/;
  fi
  if [ -d ~/.config/zsh/plugins ]; then
    CYAN "Installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/;
  else
    mkdir ~/.config/zsh/plugins/ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/;
  fi

CYAN "Installing my dwm & dmenu setup"
git clone https://github.com/madison-craig/suckless.git ~/.config/ && sudo make clean install -C ~/.config/suckless/dwm/
sleep 5
sudo make clean install -C ~/.config/suckless/dmenu/

CYAN "Making zsh the default shell"
chsh -s $(which zsh)

sleep 1

CYAN "Please reboot your system now for all changes to take effect."
CYAN "After rebooting, open up nvim and in command mode type :PlugInstall  - Wait for the Plugins to install and then exit nvim"

