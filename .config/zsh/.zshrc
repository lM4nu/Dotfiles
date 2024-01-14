if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  acpi
  exec startx "${XDG_CONFIG_HOME}"/x11/xinitrc
fi

autoload -U colors && colors
setopt PROMPT_SUBST
#[ -f /usr/share/git/completion/git-prompt.sh ] && source /usr/share/git/completion/git-prompt.sh
#export PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%c%{$fg[red]%}]%{$fg[cyan]%}$(__git_ps1 " %s ")%{$reset_color%}$%b '
if [ -f /usr/share/git/completion/git-prompt.sh ]
then
	source /usr/share/git/completion/git-prompt.sh
	export PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%c%{$fg[red]%}]%{$fg[cyan]%}$(__git_ps1 " %s ")%{$reset_color%}$%b '
else
	export PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%c%{$fg[red]%}]%{$fg[cyan]%}%{$reset_color%}$%b '
fi

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=31;42;01:st=37;44:ex=01;32:'
# Disable % eof
unsetopt prompt_cr prompt_sp

setopt autocd
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
unsetopt beep

HISTSIZE=100000
SAVEHIST=100000
source ~/.config/aliasrc

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'  # zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

sco() { find $HOME/.config/dotfiles/.config -type f | sed "s|/dotfiles/.config||;/lyrics\|plugged/d" | fzf | xargs -r $EDITOR }
resetbar() { seq 15 | while read -r n; do pkill -RTMIN+"$n" dwmblocks ; done }
