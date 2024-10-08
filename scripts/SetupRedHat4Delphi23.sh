#!/bin/bash
# 
# Download and execute with the following:
# curl -L https://tinyurl.com/SetupRedHat4Delphi23 | bash
#
echo "updating installed package"
sudo yum upgrade -y
echo "installing development tools"
sudo yum groupinstall 'Development Tools' -y
sudo yum install wget gtk3 mesa-libGL gtk3-devel -y
cd ~
echo "Downloading Linux PAServer for Athens 12.2 (23.0)"
wget https://altd.embarcadero.com/releases/studio/23.0/122/LinuxPAServer23.0.tar.gz 
echo "Setting up directories to extract PA Server into"
mkdir PAServer
mkdir PAServer/23.0
rm PAServer/22.0/*
tar xvf LinuxPAServer23.0.tar.gz -C PAServer/23.0 --strip-components=1
rm LinuxPAServer23.0.tar.gz
echo \#\!\/bin\/bash >pa23.sh
echo ~/PAServer/23.0/paserver >>pa23.sh
chmod +x pa23.sh
echo "-----------------------------------"
echo " To launch PAServer type ~/pa23.sh"
echo "-----------------------------------"
