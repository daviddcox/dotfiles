#!/usr/bin/env bash

# List of dotfiles to symlink
DOTFILES_DIR="$HOME/dotfiles"
dotfiles=(bashrc vimrc tmux.conf)

for file in "${dotfiles[@]}"; do
    ln -sf "$DOTFILES_DIR/$file" "$HOME/.$file"
done

# Neovim configuration setup
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Hyprland config
rm -rf "$HOME/.config/hypr"
ln -sf "$DOTFILES_DIR/hypr" "$HOME/.config/hypr"

# Install fzf (fuzzy finder)
if [ ! -d "$HOME/.fzf" ]; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# Install tmp for tmux
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing tpm for tmux..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Setup complete!"
