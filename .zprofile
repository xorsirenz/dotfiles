export SHELL=/bin/zsh
export EDITOR=nvim

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.zig"

export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

if [ "$(tty)" = "/dev/tty1" ]; then
    exec ~/.local/bin/dwl-start
fi
