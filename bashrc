#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias scrot='maim -s ~/Pictures/$(date +%s).png'
alias news='newsboat'
alias r='ranger'

export PS1="\[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\] \[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

export PATH=$PATH:/home/tcarroll/.bin:/home/tcarroll/.local/bin:/home/tcarroll/.gem/ruby/2.6.0/bin
export PATH=/home/tcarroll/.nimble/bin:$PATH
export PATH="/home/tcarroll/.pyenv/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export EDITOR="vim"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PASSWORD_STORE_DIR="$HOME/share/.pass"

function eac {
    local wineprefix="$HOME/.eac-prefix"
    local eacdir="${wineprefix}/drive_c/Program Files/Exact Audio Copy"
    pushd "${eacdir}/Microsoft.VC80.CRT"
    WINEPREFIX=$wineprefix WINEDEBUG=-all wine "${eacdir}/EAC.exe"
    popd
}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 
