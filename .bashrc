#!/bin/bash

if ! command -v pacman &>/dev/null; then
    echo "ERROR: 'pacman' was not found on the PATH. Please check this is an Arch based distribution."
fi

#
# these are the packages referenced within this script that are required
# to make the script execute successfully or to ensure a proper environment setup
#
required_pkgs='yay vim firefox starship nvm ^go$ ^exa$ ^xclip$ ^nerd-fonts-complete$ ^neofetch$ ^bat$'
for pkg in $required_pkgs; do
    if ! yay -Qqs "$pkg" &>/dev/null; then
        echo "WARN: package '$pkg' is required to be installed but wasn't found."
    fi
done

#
# environment
#

# XDG spec: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"

export EDITOR=vim
export BROWSER=firefox

export GOPATH="$HOME/projects/go"

#
# PATH
#
export PATH="${PATH}:${XDG_BIN_HOME}:${GOPATH}/bin"

#
# aliases
#
alias vi='vim'
alias more='less'
alias ls='exa -lb --icons --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias clip='xclip -sel clipboard'
alias open='xdg-open'
alias cat='bat'

#
# executables
#

# starship
eval "$(starship init bash)"

# nvm
source /usr/share/nvm/init-nvm.sh

# pywal
if [ -f ~/.cache/wal/sequences ]; then
    # note we unalias the 'cat' command here
    (\cat ~/.cache/wal/sequences &)
    source ~/.cache/wal/colors-tty.sh
fi

# neofetch
neofetch
