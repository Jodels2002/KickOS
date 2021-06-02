sudo apt install -y genisoimage
sudo chmod -R 777  /home/pi/Documents/
sudo unsquashfs -f -d /home/pi/Documents/KickOS/ /home/pi/Documents/temp/live/filesystem.squashfs
sudo chmod -R 777  /home/pi/Documents/
cd /home/pi/Documents/

sudo mksquashfs /home/pi/Documents/KickOS/  filesystem.squashfs




cd /home/pi/Documents/
sudo genisoimage -J -l -R -V "KickOS" -iso-level 4 -o KickOS.iso /home/pi/Documents/temp/
