#! /bin/bash

PACKAGE_INSTALL_LINE="pacman -S "
BASE_INSTALL_PACKAGES="git zsh emacs firefox pcmanfm htop weechat"
HOME="/home/$(whoami)"


$($PACKAGE_INSTALL_LINE $BASE_INSTALL_PACKAGES)

echo "Making .config directory"
mkdir $HOME/.config 1>/dev/null 2>/dev/null

echo "Copying zshrc"
cp zshrc $HOME/.zshrc
cp antigen $HOME/.config/antigen

echo "dumping gnome shell centric dconf entries"
cp dconf_dump $HOME/.config/dconf_base

echo "Copying functions/exports"
cp functions.zsh $HOME/.functions.zsh
cp exports.zsh $HOME/.exports.zsh

git config --global user.email "hiroshi@fukada.us"
git config --global user.name "Hiroshi Fukada"
