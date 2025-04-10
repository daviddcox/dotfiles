# Add cs240/bin to PATH

export PATH=$PATH:~cs240/bin
export PATH=${PATH}:/p/xinu/bin
export PATH="$HOME/.fzf/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

export MANPAGER='nvim +Man!'

# Basic aliases to have common ls commands and add colors
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"

alias facd='cd "$(find ~ -type d | fzf)"'
alias fcd='cd "$(find . -type d | fzf)"'

alias connect-404='nmcli connection up "Faith 404 - 5 GHz" passwd-file ~/.404_wifi.txt'

alias on='source venv/bin/activate'
alias vim='vimx'
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias weather="$HOME/dotfiles/weather.sh"
alias moon="$HOME/dotfiles/moon.sh"

# Strip permissions from group and others when creating new files
umask 077

export TERM="xterm-256color"

PS1='\[\033[38;5;33m\]\u\[\033[0m\]@\[\033[38;5;250m\]\h\[\033[0m\]:\[\033[38;5;39m\]\w\[\033[0m\] \$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

fde() {
  local name
  name=$(docker ps --format "{{.Names}}" | fzf --prompt="Select container: ")
  [[ -n "$name" ]] && docker exec -it "$name" /bin/bash
}

