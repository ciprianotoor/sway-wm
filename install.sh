#!/usr/bin/env bash
# Postinstall sway-wm en ubuntu 20.04
# Autor:
# Cipriano Javier Perez Garcia
# ciprianotoor@gmail.com
# https://github.com/ciprianotoor
# Version:
# v0.1: 10/02/2022 -instalacion de sway ya preconfigurado para Ubuntu 20.04 .
#ingresar credenciales
clear 
printf '\n \nDando permisos..\n'
sleep 1
sudo su
#actualizar sistema antes de aplicar
clear 
printf '\n \nConfigurando gestor de paquetes apt...\n'
sleep 1
sudo apt update;
sudo apt upgrade -y;
#Agregar repositorios
 sudo add-apt-repository -y ppa:regolith-linux/stable -y;sudo add-apt-repository ppa:mikhailnov/pulseeffects -y;add-apt-repository ppa:xtradeb/play -y;add-apt-repository ppa:xtradeb/apps -y; add-apt-repository ppa:pkgcrosswire/ppa -y;add-apt-repository ppa:atareao/atareao;add-apt-repository ppa:hsheth2/ppa -y ;;
# Paquetes adicionales SwayWM
clear
printf '\n \nInstalando paquetes adicionales...\n'
sleep 1
sudo apt install playerctl cava cmus i3-wm sway waybar rofi compton swaylock grim wf-recorder feh brightnessctl light slurp wl-clipboard blueman zsh python3-setuptools python3-lxml python3-requests python3-xdgpython3-pip  ubuntu-restricted-extras  exfat-fuse exfat-utils hfsplus hfsutils  ntfs-3g libavcodec-extra curl nano wget git ttf-mscorefonts-installer mtp-tools ipheth-utils ideviceinstaller ifuse  gdebi gdebi-core synaptic  p7zip-full p7zip-rar rar unrar build-essential mpv libreoffice  libreoffice-l10n-es myspell-es telegram-cli arduino geogebra octave cmatrix htop figlet toilet timeshift gufw firewall-config pavucontrol gnome-calendar gnome-contacts gnome-weather  adb cmake scrcpy python3-distutils pychess  python3-distutils  gnome-clocks python-dbus  flatpak gnome-software-plugin-flatpak vlc pulseeffects grub-customizer ssh transmission net-tools mc lynx remmina pythonpy -y
# zsh --pendiente
clear
printf '\n \nClonando repositorios git...\n'
sleep 1
git clone https://github.com/ciprianotoor/sway-wm /tmp/sway-wm
cp -rp /tmp/sway-wm/.* "$HOME"

sleep 2
clear
printf '\n \nFin!'
sleep 1
printf '\n \n'
# Otorgando permisos para cambiar brillo de pantalla
#sudo chmod +s /usr/bin/light

