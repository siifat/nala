#! /usr/bin/bash


#Disabling snaps in Ubuntu

echo "

Stopping Snap services.....

"

sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service


echo "Removing Snap Packages.....
"
sudo snap remove firefox -yyqq
sudo snap remove snap-store -yyqq

echo "Purging Snapd from your system...."
sudo apt-get autoremove --purge snapd -yyqq
sudo rm -rf /var/cache/snapd/
rm -rf ~/snap

echo "


Stopping Snaps from coming back...."
sudo touch /etc/apt/preferences.d/nosnap.pref
sudo echo "# To prevent repository packages from triggering the installation of Snap,
# this file forbids snapd from being installed by APT.
# For more information: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html

Package: snapd
Pin: release a=*
Pin-Priority: -10" >> /etc/apt/preferences.d/nosnap.pref


echo "


Installing Firefox non-snap...."


sudo add-apt-repository ppa:mozillateam/ppa -y
sudo touch /etc/apt/preferences.d/firefox-no-snap
sudo echo "Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1" >> /etc/apt/preferences.d/firefox-no-snap


sudo apt-get update -qq

#adding repos for nala

echo "


Adding repos for Nala....

"
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list


wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null


#updating & installing nala

echo "


Installing Nala for you...."

sudo apt-get update -qq && sudo apt-get install nala -yyqq

echo "


Done"


echo "


Installing Firefox....."
sudo nala install firefox gdebi lightdm xfce4 xfce4-goodies xfce4-whiskermenu-plugin xfce4-panel -yy


echo "



Enabling Autologin with lightdm...."
sudo touch /etc/lightdm/lightdm.conf
sudo echo "[SeatDefaults]
autologin-user=sifat" >> /etc/lightdm/lightdm.conf


echo "



All Done! Reboot"
