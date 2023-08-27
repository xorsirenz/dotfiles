# ~/.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

exec startx
. "$HOME/.cargo/env"
