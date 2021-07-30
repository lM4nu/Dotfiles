# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "XDG_CONFIG_HOME"/x11/xinitrc
fi

HISTIGNORE='clear'

set -o vi
bind -m vi-command 'C-l: clear-screen'
bind -m vi-insert 'C-l: clear-screen'

source ~/.config/.aliases

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
