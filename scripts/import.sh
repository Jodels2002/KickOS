#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#***********************************************  Import for Amiga Forever 9  *******************************


if    [ ! -d "/media/$USER/AMIGA/Shared/" ]; then
	  clear
	else
	  echo "***  Amiga Forever 9 found ***"
	  echo " "
	  echo "... copy files and install "
          mkdir /home/$USER/Amiga 
	  cp -rf /media/$USER/amigaforever.msi /home/$USER/tmp
    wine msiexec /i /home/$USER/tmp/amigaforever.msi
	  
fi

#***********************************************  Import for Pimiga  *******************************

if    [ ! -d "/media/$USER/AMIGA/Shared/" ]; then
	  clear
	else
	  echo "***  Pimiga found ***"
	  echo " "
	  echo "... copy files will take 2-5 min "
    
    mkdir /mnt/Pimiga
    mount -o loop image.img /mnt/Pimiga/
    cd /mnt/Pimiga/
    ls -l

    kpartx -av disk.img
	  
fi



