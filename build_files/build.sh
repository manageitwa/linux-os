#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# Install AppIndicator GTK3 support for some apps
dnf5 install -y libappindicator-gtk3

# Install Mailspring latest version
wget -O /tmp/mailspring.rpm https://updates.getmailspring.com/download?platform=linuxRpm
dnf5 install -y /tmp/mailspring.rpm
rm /tmp/mailspring.rpm

# Install 1Password latest version
wget -O /tmp/1password.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
dnf5 install -y /tmp/1password.rpm
rm /tmp/1password.rpm

# Install Claude Desktop Linux latest version
curl -sL $(curl -s https://api.github.com/repos/aaddrick/claude-desktop-debian/releases/latest | grep -o 'https://[^"]*x86_64\.rpm' | head -1) -o /tmp/claude-desktop.rpm
dnf5 install -y /tmp/claude-desktop.rpm
rm /tmp/claude-desktop.rpm

#### Example for enabling a System Unit File
# systemctl enable podman.socket
