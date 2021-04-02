#!/usr/bin/env bash
#You can now run fs-uae from the source folder without installation:
#    ./fs-uae

sudo apt install -y fs-uae fs-uae-arcade fs-uae-launcher fs-uae-netplay-server
sudo apt install -y autoconf automake build-essential gettext libfreetype6-dev libglew-dev libglib2.0-dev libjpeg-dev libmpeg2-4-dev 
sudo apt install -y libopenal-dev libpng-dev libsdl2-dev libsdl2-ttf-dev libtool libxi-dev 
sudo apt install -y libxtst-dev zip zlib1g-dev

cd

sudo git clone --recursive --depth 1 --branch master https://github.com/FrodeSolheim/fs-uae.git
sudo chmod -R 777 fs-uae
cd fs-uae
 ./bootstrap
 ./configure
 make
 
