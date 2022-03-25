#!/bin/bash

sudo yay -S --noconfirm $(cat yaylist | cut -d' ' -f1)
