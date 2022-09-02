#!/bin/bash
#
#
#This script installing Pyrit on Kali Linux 2022.2 and newer.
#Update and troubleshooting is implemented.
#02.09.2022
#P$$$T
#
#
# Install dependencies
sudo apt-get update
sudo apt-get install -y \
	python2-dev \
	libssl-dev \
	libpcap-dev

# Clone Repo
sudo git clone https://github.com/JPaulMora/Pyrit.git --depth=1

# Fudge code as suggested in https://github.com/JPaulMora/Pyrit/issues/591
sudo sed -i "s/COMPILE_AESNI/COMPILE_AESNIX/" Pyrit/cpyrit/_cpyrit_cpu.c

# Build and install
cd Pyrit
sudo python2 setup.py clean
sudo python2 setup.py build
sudo python2 setup.py install
cd ..

# Clean Up
sudo rm -rf Pyrit
