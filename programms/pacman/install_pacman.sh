#!/bin/bash

sudo pacman -S --noconfirm $(cat pacmanlist | cut -d' ' -f1)

git clone https://github.com/Jguer/yay.git

cd yay
makepkg -si
cd ..

