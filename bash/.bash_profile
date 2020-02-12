setxkbmap -option caps:escape

export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin/"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
