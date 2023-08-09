#!/bin/sh

if [ $USER = 'root' ]; then

	mkdir -p $HOME/.local/share
	mkdir -p $HOME/.local/bin
	mkdir -p $HOME/.config
	mkdir -p $HOME/.cache

	cp .zprofile $HOME
	cp .config/zsh/.zshrc $HOME
	echo "source ~/.zprofile" >> $HOME/.zshrc

	cp .local/bin/lfrun $HOME/.local/bin

	cp .config/aliasrc $HOME/.config
	cp .config/nvim $HOME/.config
	cp .config/lf $HOME/.config

else
fi

