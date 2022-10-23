#!/usr/bin/env bash


# Installing VSCode repo
echo "Installing VSCode Repo...."
sleep 1s
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Install packages
echo "Installing Packages...."
sleep 1s
dnf check-update
sudo dnf -y install $(cat scripts/linux_packages.txt)

# Install teamviewer
echo "Installing TeamViewer...."
sleep 1s
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf -y install ./teamviewer.x86_64.rpm
rm teamviewer.x86_64.*
