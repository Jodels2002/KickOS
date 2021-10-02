#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************


#***********************************************  #Preinstall stuff *****************************************


 
sudo cp -R /home/$USER/KickOS/scripts/* /usr/local/bin
cp -rf  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
sudo apt-get install -y toilet dialog 

if [ ! -d /home/$USER/.backup/ ]; then
mkdir /home/$USER/.backup/
fi
clear


#*************************************************************************************************************
  

      clear
      toilet "KickOS" --metal

      echo ""
      echo " "
      echo "1>	Hi Guys,"
      echo " "
      echo "1>	welcome to the "KickOS" installer! "
      echo "1>CLI"
      echo "1>CLI"
      echo "1>	Please note that the Kickroms and Workbench files are still under copyright (Amiga Forever)!  "
      echo "1>CLI"
      echo "1>	So only use this image if you own the original Amigas, Amiga Forever."
      echo "1>CLI: "
      echo "1>                  Greetings your´s "
      echo "1>Assign >NIL:      Bernd Titze"
      echo " "
      echo " " 
      echo "	LOADWB ...  :-)"
      sleep 3s
      echo " "
      echo " "     
