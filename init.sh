#!/usr/bin/env bash

# List of dotfiles to symlink
DOTFILES_DIR="$HOME/dotfiles"
dotfiles=(bashrc vimrc tmux.conf)

for file in "${dotfiles[@]}"; do
    ln -sf "$DOTFILES_DIR/$file" "$HOME/.$file"
done

# Neovim configuration setup
mkdir -p "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/init.lua" "$HOME/.config/nvim/init.lua"

# Hyprland config
mkdir -p "$HOME/.config/hypr"
ln -sf "$DOTFILES_DIR/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"

# Install Vim-Plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "Installing Vim-Plug for Vim..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Vim-Plug for Neovim
if [ ! -f "$HOME/.config/nvim/autoload/plug.vim" ]; then
    echo "Installing Vim-Plug for Neovim..."
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install fzf (fuzzy finder)
if [ ! -d "$HOME/.fzf" ]; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# Install Dracula theme for tmux
if [ ! -d "$HOME/.tmux/dracula" ]; then
    echo "Installing Dracula theme for tmux..."
    git clone https://github.com/dracula/tmux.git ~/.tmux/dracula
fi

# Install tmp for tmux
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing tpm for tmux..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Setup complete!"
