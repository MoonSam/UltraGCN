#!/bin/bash

########################
## Common part
########################
echo "***************************************************"
echo " Script for setting up Mint 17 Rosa"
echo "	Designed by Gunjae Koo (gunjae.koo@gmail.com)"
echo "	(NO WARRANTY, EXECUTE AT YOUR OWN RISKS)"
echo "***************************************************"
sudo apt-get update
#sudo apt-get upgrade

sudo apt-get install -y git curl g++ build-essential
sudo apt-get install -y openssh-server samba cifs-utils ntfs-3g #samba: data share util, cifs: similar as samba ntfs: file system for windows
sudo apt-get install -y htop lsb neofetch #htop: process viewer lsb: linux standard base support package neofetch: systme information tool on bash
sudo apt-get install -y vim rdate gcc make locate tmux wget net-tools # 

echo ""
echo "***************************************************"
echo " Common settings"
echo "***************************************************"
# Log-in option
sudo systemctl get-default
sudo systemctl set-default multi-user.target
sudo systemctl get-default

# Clock
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
sudo rdate -s time.bora.net
sudo hwclock --systohc
date

echo ""
echo "***************************************************"
echo "SSH Setup"
echo "***************************************************"
# SSH config
confirm "SSH setup" && \
	sudo perl -pi -e "s/Port 22/Port 22000/g" /etc/ssh/sshd_config && \
	sudo perl -pi -e "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config && \
	echo "AllowGroups sshusers" | sudo tee -a /etc/ssh/sshd_config

## UMASK config (it sometimes causes errors)
#confirm "umask setup" && \
#	sudo perl -pi -e "s/UMASK		022/UMASK		027/g" /etc/login.defs && \
#	grep UMASK /etc/login.defs

GIT_NAME="MoonSam"
GIT_EMAIL="ty5623@naver.com"

echo "***************************************************"
echo " Setup Git environment"
git config --global user.name "${GIT_NAME} (@$HOSTNAME)"
git config --global user.email "${GIT_EMAIL}"
#git config --global core.editor "vi"
echo "You can find git golbal configuration file ~/.gitconfig"
echo ""

cat ~/.gitconfig

# ***********************************
#	Disabling unnecessary services
# ***********************************
source setup_header.sh

disable_service "cups-browsed.service"
disable_service "cups.service"
disable_service "bluetooth.service"
disable_service "whoopsie.service"
#disable_service ""

#echo "Need to reboot this machine"
