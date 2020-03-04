#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



PS1='[\u@\h \W]\$ '

[[ -f ~/.config/bash/aliasrc ]] && . ~/.config/bash/aliasrc

export TERM=xterm-color
