#! /usr/bin/env sh

sudo -s

export DEBIAN_FRONTEND=noninteractive

# update packages
apt-get update -y
apt-get update -y --fix-missing
apt-get -o Dpkg::Options::="--force-confnew" -o Dpkg::Options::="--force-confold" --force-yes -fuy upgrade

apt-get install -y python-software-properties
add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
add-apt-repository "deb http://ppa.launchpad.net/dns/gnu/ubuntu $(lsb_release -sc) main"
apt-get update -y
