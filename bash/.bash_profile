setxkbmap -option caps:escape

[[ -f ~/.bashrc ]] && . ~/.bashrc

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
