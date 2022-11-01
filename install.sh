#!/bin/sh

#sync
sudo pacman -Syu

#enable artix repos
#sudo ./artixrepos.sh

#install packages
sudo ./packages.sh

#install ungoogled chromium
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
echo '
[home_ungoogled_chromium_Arch]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
sudo pacman -Sy ungoogled-chromium

#compile paru
git clone "https://aur.archlinux.org/paru.git"
cd paru
makepkg -si
cd ..

#install aur packages
./aurpackages.sh

#compile suckless programs
sudo make -C suckless/dwm install
sudo make -C suckless/dwmblocks install
sudo make -C suckless/slock install
sudo make -C suckless/dmenu install

#install vimplug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#enable custom hooks
[ -d /etc/pacman.d/hooks ] || sudo mkdir -p /etc/pacman.d/hooks
sudo cp dash.hook dwmblocks.hook /etc/pacman.d/hooks/

#link sh to dash
sudo ln -sfT dash /usr/bin/sh

#set custom thubmnailers
sudo cp thubmnailers/*.thumbnailer /usr/share/thumbnailers/
sudo cp thubmnailers/cb*thumbnail /usr/local/bin/

#move configs to $HOME
cp .zprofile ~
cp -r .config .local ~
cp .config/aliasrc .config/chromium-flags.conf .config/mimeapps.list ~/.config/

#change shell to zsh
chsh -s /bin/zsh
