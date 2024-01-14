export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/status:$HOME/.local/bin/display"
export BROWSER=firefox
export EDITOR=nvim
export TERMINAL=alacritty
export STATUSBAR=dwmblocks

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export ELINKS_CONFDIR="${XDG_CONFIG_HOME:-$HOME/.config}/elinks"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export MYSQL_HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/mysql_history"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME:-$HOME/.config}/java"
export KODI_DATA="${XDG_CONFIG_HOME:-$HOME/.config}/kodi"
export LEIN_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/lein"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/isync/mbsyncrc"
export NMBGIT="${XDG_DATA_HOME:-$HOME/.local/share}/notmuch/nmbug"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch/notmuchrc"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"
export QT_QPA_PLATFORMTHEME="qt5ct"
export RANDFILE="${XDG_CONFIG_HOME:-$HOME/.config}/rnd"
export SSB_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zoom"
export VSCODE_PORTABLE="${XDG_DATA_HOME:-$HOME/.local/share}/vscode"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/.config}/x11/Xauthority"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export FZF_DEFAULT_OPTS="--bind=alt-j:down,alt-k:up"
export JQ_COLORS="1;32:0;35:0;35:1;33:0;32:1;37:1;39"

export LESS="-i -R"
export LESSOPEN="| bat --color=always --theme=gruvbox-dark -pp %s"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history"

export WEBUI="--script=$HOME/.local/share/simple-mpv-webui/main.lua"
export BEMENU_OPTS="-p \"\" --nb \"#000000\" --nf \"#ebdbb2\" --ab \"#000000\" --af \"#ebdbb2\" --hb \"#ebdbb2\" --hf \"#000000\" --fb \"#000000\" --ff \"#ebdbb2\" --tb \"#ebdbb2\" --tf \"#000000\" --cf \"#ebdbb2\" --fn \"DejaVu Sans Mono 11\" -H 24"

#[ ! -s $HOME/.config/mpd/mpd.pid ] && mpd
