#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind -m vi-insert "\C-l":clear-screen


#PS1='[\u@\h \W]\$ '
#PS1="\[\033[38;5;43m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;43m\]\h\[$(tput sgr0)\]: \[$(tput sgr0)\]\[\033[38;5;28m\]\w\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"

PS1="\[\033[38;5;43m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;28m\]\w\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"



[[ -f ~/.config/bash/aliasrc ]] && . ~/.config/bash/aliasrc

export TERM=xterm-256color
alias scr="sudo screen /dev/ttyUSB0 115200"
#alias 1sc="xrandr -—output HDMI-3 —-auto -—scale 1.0x1.0 -—output LVDS-1 —-off" 
alias 1sc="xrandr --output HDMI-3 --auto --scale 1.0x1.0 --output LVDS-1 --off ; nitrogen --restore"
alias laptop="xrandr --output LVDS-1 --auto --scale 1.0x1.0 --output HDMI-3 --off"

