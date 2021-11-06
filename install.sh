#!/bin/sh
pacman -S \
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
chsh -s /bin/zsh
