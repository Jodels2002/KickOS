#!/bin/bash
# Assign >NIL:  Install KickOS
# Assign >NIL:  B.Titze 2021
#******************************************** #startup-sequence  :-) ************* ********************************************

clear
echo "Welcome to KickOS"
echo " "
echo " "
      sudo chmod -R 777 /home/$USER/KickOS/
      sudo cp -R /home/$USER/KickOS/scripts/* /usr/local/bin
      sudo chmod -R 777 /usr/local/bin/
      
      sudo apt-get update --allow-releaseinfo-change
      sudo apt -y update
      sudo apt -y upgrade
      sudo apt-get install -y toilet dialog mc zip unzip 
      


# sudo apt-get install -y linux-headers-$(uname -r)
cp  /home/$USER/KickOS/scripts/bashrc /home/$USER/.bashrc


cd /home/$USER

 echo "VirtualBox...."    
      cd /home/$USER/KickOS/.pac/
       
      sudo ./VBoxLinuxAdditions.run
     
      echo " "
      echo " "

     
      echo " "
      echo " "
sudo raspi-config nonint do_boot_behaviour B2
sudo reboot
