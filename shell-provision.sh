#! /usr/bin/env sh

sudo -s
# update packages
apt-get update -y
apt-get update -y --fix-missing

# upgrade installed packages
apt-get upgrade -y

apt-get install -y linux-headers-generic-lts-raring linux-image-generic-lts-raring python-software-properties
add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
add-apt-repository "deb http://ppa.launchpad.net/dns/gnu/ubuntu $(lsb_release -sc) main"
apt-get update -y
