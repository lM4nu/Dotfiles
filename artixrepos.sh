#!/bin/sh

pacman -S artix-archlinux-support
echo "[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

#[multilib]
#Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
