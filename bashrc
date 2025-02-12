# Add cs240/bin to PATH

export PATH=$PATH:~cs240/bin
export PATH=${PATH}:/p/xinu/bin
export PATH="$HOME/.fzf/bin:$PATH"

export MANPAGER="vim -c 'set ft=man'"

# Basic aliases to have common ls commands and add colors

alias ls="ls --color=auto"

alias la="ls -a"

alias ll="ls -l"

# Strip permissions from group and others when creating new files

umask 077

export TERM="xterm-256color"

PS1='\[\033[38;5;33m\]\u\[\033[0m\]@\[\033[38;5;250m\]\h\[\033[0m\]:\[\033[38;5;39m\]\w\[\033[0m\] \$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
