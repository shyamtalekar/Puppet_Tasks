# This script sets up a Upgrade to Debian 11 Bullseye

set -e

echo "update all the packages on your Debian system"
sudo apt update -y
sudo apt full-upgrade -y

echo "remove any unused dependencies"
sudo apt autoremove -y

echo "take backup and replace all instances of stretch with bullseye"
sudo cp -v /etc/apt/sources.list /root/
sudo cp -rv /etc/apt/sources.list.d/ /root/
sudo sed -i 's/stretch/bullseye/g' /etc/apt/sources.list
sudo sed -i 's/stretch/bullseye/g' /etc/apt/sources.list.d/*

echo "upgrade to Debian 11 Bullseye"                                                                                                                         
sudo apt update -y                                                                                                                                          
sudo apt upgrade -y

echo "apt full-upgrade to complete the upgrade to Debian 11"
sudo apt full-upgrade -y

echo "reboot your system"
sudo reboot

echo "Finished upgrade to Debian 11(Bullseye)"  
