#!/bin/sh
sudo pacman -Syu

#sudo ./artixrepos.sh

sudo ./packages.sh

git clone "https://aur.archlinux.org/paru.git"
cd paru
makepkg -si
cd ..

./aurpackages.sh

sudo make -C suckless/dwm install
sudo make -C suckless/dwmblocks install
sudo make -C suckless/slock install
sudo make -C suckless/dmenu install

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

[ -d /etc/pacman.d/hooks ] || sudo mkdir -p /etc/pacman.d/hooks
sudo cp dash.hook dwmblocks.hook /etc/pacman.d/hooks/
sudo ln -sfT dash /usr/bin/sh

cp .zprofile ~
cp -r .config .local ~

chsh -s /bin/zsh
