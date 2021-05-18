#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021


 if [ ! -d "/home/pi/.wine/drive_c/Program Files/WinUAE/" ]; then
 cd
      sudo apt -y install gnupg2 software-properties-common
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository https://dl.winehq.org/wine-builds/debian/

sudo rm -rd /home/pi/.wine/
sudo apt-get purge -y  wine32 wine wine64

sudo apt install -y wine32

wine msiexec /i ~/Desktop/A      wine32 \
      libwine \
      libwine:i386 \
      fonts-wine
     
    
      
      cd
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400.msi
      #wine msiexec /i ~/Desktop/AmigaForever.msi
      wine msiexec /i wine msiexec /i InstallWinUAE4400.msi

      sudo rm -rf /home/pi/Desktop/WinUAE.lnk
fi

#***********************************************  Import for Amiga Forever 9  *******************************


if    [ ! -d "/home/pi/.wine/drive_c/Program Files/Cloanto/Amiga Forever/" ]; then
	  clear
	else
	  echo "***  Amiga Forever 9 found ***"
	  echo " "
	  echo "... copy files and install "
         
      cd /home/pi/Desktop/

      wine msiexec /i wine msiexec /i AmigaForever9Plus.msi
      cp -rf "/home/pi/.wine/drive_c/users/Public/Documents/Amiga Files/Shared/*" ~/Amiga 
      cp -rd "/home/pi/.wine/drive_c/users/Public/Documents/Amiga Files/Games" ~/Amiga/  
      cp -rd "/home/pi/.wine/drive_c/users/Public/Documents/Amiga Files/Systems/" ~/Amiga  
       
        
    fi  
      
if    [ ! -d "/home/pi/.wine/drive_c/Program Files/Cloanto/C64 Forever/" ]; then
	  clear
	else
	  echo "***  C64 Forever 9 found ***"
	  echo " "
	  echo "... copy files and install "
         
     wine msiexec /i wine msiexec /i C64Forever9Plus.msi
 
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

 



