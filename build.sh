#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install Evolution, EWS and legacy iptables
# Note: iptables-legacy is needed for Docker-in-Docker compatibility within VSCode
rpm-ostree install \
    evolution \
    evolution-ews \
    iptables-legacy

# Install 1Password
rpm-ostree install https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

#### Example for enabling a System Unit File
systemctl enable podman.socket
