#!/bin/bash
# Assign >NIL:  Install KickPi-OS - not for use!!!
# Assign >NIL:  B.Titze 2021


#******************************************** #startup-sequence  :-) ************* ********************************************
AmigaForever=/media/pi/AMIGA/Shared/
#****************************************************************************************************************


clear
echo "Good choise :-) "

      
      sudo rm -rf ~/.KickPi-OS
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo apt -y update
      whiptail --msgbox "  Puh,... ready now... okey, here we are ... lets see and start the KickPi-OS Desktop :-)" 20 60 1
      
      if [ ! -f /home/$USER/.backup/.bashrc ]; then
      echo "Backup Settings...."
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp  /home/$USER/.bashrc /home/$USER/.backup/.bashrc
      cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
      sudo chmod -R 777 ~/.bashrc
      echo " "
      echo " "
      
      else
      
      echo "Everything is fine... :-)"
    
      fi
      
      
      if [ ! -f "$AmigaForever" ]; then
          clear
          echo "AmigaForever found "
          echo "... copy files will take 5-10 min... "
	  echo " "
          echo " "
          mkdir /home/$USER/Amiga
          cp -rf /media/pi/AMIGA/Shared/* /home/$USER/Amiga/
	    
      fi


sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
sudo raspi-config nonint get_config_var gpu_mem_256 /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
   
sudo reboot
