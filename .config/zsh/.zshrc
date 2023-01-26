if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  acpi
  exec startx "${XDG_CONFIG_HOME}"/x11/xinitrc
fi

[ -f /usr/share/git/completion/git-prompt.sh ] && source /usr/share/git/completion/git-prompt.sh
autoload -U colors && colors
setopt PROMPT_SUBST
export PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%c%{$fg[red]%}]%{$fg[cyan]%}$(__git_ps1 " %s ")%{$reset_color%}$%b '
# Disable % eof
unsetopt prompt_cr prompt_sp

setopt autocd
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
unsetopt beep

HISTSIZE=10000
SAVEHIST=10000
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

se(){ 
	[ ! -z "$1" ] && [ -f "$HOME/.local/bin/$1" ] && "$EDITOR" "$HOME/.local/bin/$1" ||
		find $HOME/.local/bin -type f | fzf | xargs -r $EDITOR 
}
sco() { find $HOME/.config/dotfiles/.config -type f | sed "s|/dotfiles/.config||;/lyrics\|plugged/d" | fzf | xargs -r $EDITOR }
resetbar() { seq 15 | while read -r n; do pkill -RTMIN+"$n" dwmblocks ; done }
