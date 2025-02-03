#!/bin/bash

DOTFILES_DIR="$HOME/.dot-files"

# List of dotfiles to symlink
dotfiles=(.bashrc .vimrc)

for file in "${dotfiles[@]}"; do
    ln -s -f ~/.dot-files/.$file ~/.$file
done

