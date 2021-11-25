export PATH=$PATH:$HOME/.local/bin
export EDITOR=nvim
export TERMINAL=alacritty
export BROWSER=brave


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export _JAVA_AWT_WM_NONREPARENTING=1
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export SSB_HOME="$XDG_DATA_HOME"/zoom
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export LEIN_HOME="$XDG_DATA_HOME"/lein
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export XAUTHORITY="$XDG_CONFIG_HOME"/x11/Xauthority
export KODI_DATA="$XDG_CONFIG_HOME"/kodi
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RANDFILE="$XDG_CONFIG_HOME"/rnd

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_CONFIG_HOME"/zsh/history

[ -f "$HOME/.config/lf/icons" ] && source "$HOME/.config/lf/icons"
[ ! -s $HOME/.config/mpd/mpd.pid ] && mpd
