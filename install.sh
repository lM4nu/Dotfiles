#!/bin/sh
sudo pacman -Syu

sudo pacman -S \
zsh \
base-devel \
git \
alacritty \
dunst \
wget \
qrencode \
acpilight \
noto-fonts-emoji \
noto-fonts \
ttf-dejavu \
ttf-font-awesome \
ttf-nerd-fonts-symbols \
keepassxc \
newsboat \
zathura \
zathura-pdf-mupdf \
ncmpcpp \
mpd \
mpc \
mpv \
sxiv \
sxhkd \
neovim \
pamixer \
pulsemixer \
maim \
xclip \
xsel \
xwallpaper \
bc \
lm_sensors \
clipmenu \
bat \
ffmpegthumbnailer \
ueberzug \
imagemagick \
poppler \
perl-image-exiftool \
catdoc \
docx2txt \
lxappearance \
kvantum-qt5 \
arc-icon-theme \
materia-gtk-theme \
mesa \
xf86-video-intel \
vulkan-intel \
libva-intel-driver

git clone "https://aur.archlinux.org/paru.git"
cd paru
makepkg -si
cd ..

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo make -C suckless/dwm/ install
sudo make -C suckless/dwmblocks/ install
sudo make -C suckless/slock/ install
sudo make -C suckless/dmenu/ install

./aurpackages.sh

chsh -s /bin/zsh
