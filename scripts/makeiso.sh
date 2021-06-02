sudo chmod -R 777  /home/pi/Documents/
sudo unsquashfs -f -d /home/pi/Documents/KickOS/ /home/pi/Documents/temp/live/filesystem.squashfs
sudo chmod -R 777  /home/pi/Documents/
cd /home/pi/Documents/

sudo mksquashfs /home/pi/Documents/KickOS/  filesystem.squashfs



sudo apt install -y genisoimage
sudo rm -rf /tmp
sudo mkdir /tmp

git clone --depth=1 https://github.com/Tomas-M/linux-live.git
chmod -R 777 linux-live
cd linux-live
sudo ./build 
