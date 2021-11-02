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
      
      
      sudo apt -y update
      sudo apt -y upgrade
      sudo apt-get install -y toilet dialog mc zip unzip 
      whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1
sudo chmod -R 777 /home/$USER/KickOS/


if    [ ! -d "/media/$USER/AMIGA/Shared/" ]; then
	  clear
	else
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files will take 2-5 min "
          mkdir /home/$USER/Amiga 
	  cp -rf /media/$USER/AMIGA/Shared/* ~/Amiga  
	  
          fi


# sudo apt-get install -y linux-headers-$(uname -r)
cp  /home/$USER/KickOS/scripts/bashrc /home/$USER/.bashrc

# sudo raspi-config nonint do_boot_behaviour B2
cd /home/$USER

 echo "VirtualBox...."    
      cd /home/$USER/KickOS/.pac/
       
      sudo ./VBoxLinuxAdditions.run
     
      echo " "
      echo " "

     
      echo " "
      echo " "
 
sudo reboot
