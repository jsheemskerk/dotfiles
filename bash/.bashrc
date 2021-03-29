#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind -m vi-insert "\C-l":clear-screen

PS1="\[\033[38;5;43m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;28m\]\w\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"



[[ -f ~/.config/bash/aliasrc ]] && . ~/.config/bash/aliasrc

export TERM=xterm-256color
export HISTCONTROL=ignoredups:erasedups


case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac


#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export PATH=$PATH:$HOME/.local/bin
export PYTHONSTARTUP=$HOME/.startup.py
