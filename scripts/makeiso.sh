
sudo apt install -y genisoimage
sudo rm -rf /tmp
sudo mkdir /tmp

git clone --depth=1 https://github.com/Tomas-M/linux-live.git
chmod -R 777 linux-live
cd linux-live
sudo ./build 
