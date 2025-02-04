#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# List of dotfiles to symlink
dotfiles=(.bashrc .vimrc .tmux.conf)

for file in "${dotfiles[@]}"; do
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

# Download and install Gruvbox theme for Vim
GRUVBOX_DIR="$HOME/.vim/pack/default/start/gruvbox"

if [ ! -d "$GRUVBOX_DIR" ]; then
    git clone https://github.com/morhetz/gruvbox.git "$GRUVBOX_DIR"
fi

mkdir -p ~/.vim/colors
cp "$GRUVBOX_DIR/colors/gruvbox.vim" ~/.vim/colors/

# Install Vim-Plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "Installing Vim-Plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Setup complete!"

