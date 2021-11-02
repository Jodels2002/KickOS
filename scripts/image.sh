cd 

 mkdir img
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -P ~/bin
chmod +x ~/bin/pishrink.sh

sudo dd if=/dev/sdd of=~/raspberry-pi.img
