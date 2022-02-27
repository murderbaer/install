#!/bin/bash

sudo pacman -S --noconfirm $(cat yaylist | cut -d' ' -f1)

git clone https://github.com/Jguer/yay.git

cd yay
makepkg -si
cd ..

