
sudo python3 -m pip install -U pip
sudo python3 -m pip install -U setuptools
#https://github.com/henrikstengaard/amiga-workbench-setup.git
sudo pip install amitools
#sudo pip3 install -U  git+https://github.com/cnvogelg/amitools.git
#xdftool mydisk.hdf unpack
cd /home/$USER/Amiga/hdf/
if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      else 
      echo " "
      
      fi
      cd "/home/pi/Amiga/hdf/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/tmp/
      cp -rf "/home/pi/Amiga/hdf/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/tmp/
      
      #cd /home/pi/Amiga/adf/
      #xdftool amiga-os-300-workbench.adf unpack /home/pi/tmp/
      #cp -rf /home/pi/tmp/Workbench3.0/ /home/pi/tmp/DH0/
      #cp -rf /home/pi/tmp/System/* /home/pi/tmp/DH0/
      #cp -rf /home/pi/tmp/System/T/Science /home/pi/tmp/DH0/S/Startup-Sequence
      
      
      
