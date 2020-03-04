setxkbmap -option caps:escape

export PATH="$PATH:$HOME/.local/bin/"
export EDITOR="nvim"
export TERMINAL="termite"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
