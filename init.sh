#!/bin/bash

DOTFILES_DIR="$HOME/.dot-files"

# List of dotfiles to symlink
dotfiles=(.bashrc .vimrc)

for file in "${dotfiles[@]}"; do
    ln -sf "$DOTFILES_DIR/.$file" "$HOME/.$file"
done

