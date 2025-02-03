#!/bin/bash

DOTFILES_DIR="$HOME/.dot-files"

# List of dotfiles to symlink
dotfiles=(.bashrc .vimrc)

for file in "${dotfiles[@]}"; do
    if [ -e "$HOME/$file" ]; then
        echo "$file already exists. Skipping..."
    else
        ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
        echo "Created symlink for $file"
    fi
done

