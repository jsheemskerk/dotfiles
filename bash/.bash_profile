#setxkbmap -option caps:escape

export PATH="$PATH:$HOME/.local/bin/"
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="brave"
export GUI_EDITOR="gedit"

[[ -f ~/.bashrc ]] && . ~/.bashrc

sudo loadkeys .config/keystring

if [ "$(tty)" = "/dev/tty1" ] 
then
	echo "press enter to startx:"
	read key
	[ -z "$key" ] && exec startx
fi
