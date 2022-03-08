#!/bin/sh
sudo pacman -Syu

sudo pacman -S \
zsh \
base-devel \
moreutils \
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
ffmpeg \
ncmpcpp \
mpd \
mpc \
mpv \
sxiv \
sxhkd \
neovim \
pamixer \
pulsemixer \
pipewire \
pipewire-alsa \
pipewire-pulse \
wireplumber \
yt-dlp \
youtube-dl \
maim \
xss-lock \
xclip \
xsel \
xwallpaper \
xdotool \
zbar \
zip \
unzip \
transmission-cli \
bc \
fzf \
lm_sensors \
clipmenu \
bat \
ffmpegthumbnailer \
ueberzug \
imagemagick \
poppler \
perl-image-exiftool \
mediainfo \
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

./aurpackages.sh

sudo make -C suckless/dwm install
sudo make -C suckless/dwmblocks install
sudo make -C suckless/slock install
sudo make -C suckless/dmenu install

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

chsh -s /bin/zsh

cp .zprofile ~
cp -r .config .local ~
