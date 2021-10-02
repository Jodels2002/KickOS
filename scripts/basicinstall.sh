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
      
      
sudo rm -rf /home/$USER/.local/share/Trash/*
       
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
     
#******************************************** #KickOS mini  Menu ********************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="KickOS"
TITLE="Witch KickOS you want?"
MENU="Please select:"

OPTIONS=(1 "Install KickOS                                   (ca. 30 min)"
	 2 "Install KickOS + RetroPie                        (ca. 40 min)"
         3 "Install KickOS full ( RetroPie, Office, Gimp...  (ca. 70 min)")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   


#*********************************************  #Time to update:)  **********************************************
#****************************************************************************************************************

KickOS_Update() {

      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo " "
      echo "Installing KickOS Update System ..."
      echo " "
      echo " "
      
      sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
      sudo apt purge -y raspberrypi-ui-mods 
       sudo apt purge -y libreoffice*
      sudo apt purge -y cups cups-client cups-common cups-server-common
      sudo dpkg --configure -a
      sudo apt-get -y update
      sudo apt-get -y upgrade
      clear
      toilet "KickOS" --metal
      sudo apt-get install -y linux-headers-$(uname -r)
      sudo apt-get install -y linux-headers
      sudo apt-get install -y linux-image
      
      echo " "
      echo " "
      echo "           System is cleaned now :-)              "
      

}

#*********************************************  #Installing KickOS_Tools*********************************
#**********************************************************************************************************

KickOS_Tools() {

      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      echo "            Lets install some usefull Tools:)              "
      echo " "
      echo " "

          
      
      sudo apt install -y  geany geany-plugins-common geany-common zip  unzip xmlstarlet mc
      sudo apt install -y  gparted p7zip-full
      sudo apt install -y  transmission
      
      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      
      #Some little Amiga stuff....
      
      echo " "
      echo " "
      sudo apt-get -y install  grafx2 protracker  worker xdms 
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -rf /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
  
  if [ ! -d /home/$USER/sc/cool-retro-term/ ]; then
      
       clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      echo "cool-retro-term"
      ./retro-term.sh
      fi
      
    
     
      
      

      if [ ! -d /home/$USER/games/vice/ ]; then
	clear
      toilet "KickOS" --metal

        echo " "
        echo " "
      
	echo "Vice64"
     	echo " "
     	echo " "
     	sudo apt install -y autoconf automake build-essential byacc dos2unix flex libavcodec-dev libavformat-dev libgtk2.0-cil-dev libgtkglext1-dev libmp3lame-dev libmpg123-dev libpcap-dev libpulse-dev libreadline-dev libswscale-dev libvte-dev libxaw7-dev subversion yasm libgtk3.0-cil-dev xa65 libsdl2-dev libsdl2-image-dev libgtk-3-dev libglew-dev
     	cd /home/$USER/KickOS/.pac/
      	unzip -u  /home/$USER/KickOS/.pac/vice.zip
      	unzip -u  /home/$USER/KickOS/.pac/Vice2.zip
      	sudo mkdir /home/$USER/games
      	sudo cp -rf /home/$USER/KickOS/.pac/vice /home/$USER/games
      	sudo cp -rf /home/$USER/KickOS/.pac/Vice2/* /home/$USER/games/vice/
   
      	sudo chmod -R 777 /home/$USER/games/vice/
       fi
      
}

#*********************************************  #Office  **********************************************
#****************************************************************************************************************

KickOS_Office() {

      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      echo "            Some Office Tools:)              "
      echo " "
      #sudo apt install -y imagemagick krita-l10n gparted synaptic
      
      sudo apt install -y libreoffice 

}


#*********************************************  #Installing KickOS Desktop*********************************
#**********************************************************************************************************
 
 KickOS_Desktop() {
 
 
  
      
      sudo update-rc.d motd remove
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      
      
      
      sudo cp -rf ~/KickOS ~/.KickOS
      sudo rm -rf /home/$USER/.cache
      cd /home/$USER/KickOS/
      cp -rf ~/KickOS/config/Desktop/* /home/$USER/Desktop/
      

      sudo unzip ~/KickOS/.pac/.data.zip
      sudo cp -rf /home/$USER/KickOS/.data/.config/ /home/$USER/
      sudo cp -rf /home/$USER/KickOS/.data/.local/ /home/$USER/  
     
      sudo chmod -R 777 /home/$USER/KickOS
      sudo chmod -R 777 /home/$USER/.local
      sudo chmod -R 777 /home/$USER/.config
      sudo rm -rf /home/$USER/.cache
      # Fresh install Amiga Desktop
    
if [ ! -d /usr/share/icons/AMIGAOSLINUX/ ]; then

      cd /usr/share/icons/
      
      sudo cp -rf /home/$USER/KickOS/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip -u  /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      sudo rm -rf /usr/share/icons/Adwaita
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/Adwaita/
      sudo chmod -R 777 /usr/share/icons/
 fi   

if [ ! -d /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/KickOS
      git clone --depth=1 https://github.com/x64k/amitk
      toilet "KickOS" --metal

      echo " "
      echo " "
      sudo cp -rf /home/$USER/KickOS/amitk /usr/share/themes
      
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      toilet "KickOS" --metal

      echo " "
      echo " "
      clear
      toilet "KickPi-OS" --metal
      sudo cp -rf /home/$USER/KickOS/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /home/$USER/KickOS/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
      echo " "
      
fi
  
  
      if [ ! -f /home/$USER/.worker/.worker.zip ]; then
      # First installation
      #*************************************************************************************************************
      cd /home/$USER/KickOS/.pac/
      unzip -u  /home/$USER/KickOS/.pac/.worker.zip
      cp -rf /home/$USER/KickOS/.pac/.worker /home/$USER/
      sudo chmod -R 777 /home/$USER/.worker/
      fi

       mkdir /home/$USER/Amiga/ 
       mkdir /home/$USER/Amiga/conf/ 
       mkdir /home/$USER/Amiga/Kickstarts/ 
   
       
       

}


#***************************************** # Install FS-UAE  *********************************************
#****************************************************************************************************************
     
     
 KickOS_FS-UAE() {
  
      
#*************************************************************************************************************
      toilet "KickOS" --metal

      echo " "
      echo " "
       echo "  ... here comes FS-UAE  :-) "
       
       sudo apt install -y fs-uae fs-uae-arcade fs-uae-launcher fs-uae-netplay-server
       # sudo apt install -y autoconf automake build-essential gettext libfreetype6-dev libglew-dev libglib2.0-dev libjpeg-dev libmpeg2-4-dev 
       # sudo apt install -y libopenal-dev libpng-dev libsdl2-dev libsdl2-ttf-dev libtool libxi-dev 
       # sudo apt install -y libxtst-dev zip zlib1g-dev
      
     
      
 

 }
 
 
 #***************************************** # Install WinUAE  *********************************************
#****************************************************************************************************************
     
     
 KickOS_WinUAE() {
  if [ ! -f /home/$USER/Amiga/InstallWinUAE4400.msi  ]; then 
       mkdir /home/$USER/Amiga/ 
       mkdir /home/$USER/Amiga/conf/ 
       mkdir /home/$USER/Amiga/kickstarts/ 

 clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      
       echo "  ... here comes WinUAE :-) "
      
      
       
sudo dpkg --add-architecture i386 

wget -nc https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/i386/libfaudio0_20.01-0~buster_i386.deb
sudo apt install -y ./libfaudio0_20.01-0~buster_i386.deb

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key


sudo apt-get install -y software-properties-common

sudo apt-add-repository 'deb http://dl.winehq.org/wine-builds/debian/ buster main'
sudo apt update
sudo apt upgrade


sudo apt-get install -y --install-recommends winehq-stable

wine msiexec /i ~/Desktop/A      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
      
      
      cd
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400.msi
      #wine msiexec /i ~/Desktop/AmigaForever.msi
      wine msiexec /i wine msiexec /i InstallWinUAE4400.msi
      
     fi
      

 }
 
#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
Configure_Amiga() {

       
   if [ ! -d /home/pi/Amiga/dir/WB ]; then
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools  
      
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/WB
      #xdftool amiga-os-300-workbench.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-workbench.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-extras.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-fonts.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-locale.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-storage.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-install.adf unpack /home/pi/Amiga/dir/WB
     fi 
      
      mkdir /home/pi/Amiga/Install
      




      

if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      
      cd /home/pi/Amiga/Install
      
      
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      mv  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
        else 
      echo " "
      
      fi
      
      sudo rm -rf  /home/pi/Amiga/dir/System_P96/
      sudo rm -rf  /home/pi/Amiga/dir/System_ADVSP/
      
      
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      
      mkdir /home/pi/Amiga/dir/System_ADVSP
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_ADVSP/System/T/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Software /home/pi/Amiga/dir/System_ADVSP/System/
      cp -rf /home/pi/Amiga/dir/Games/Kickstarts /home/pi/Amiga/dir/System_ADVSP/System/Devs/
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_P96/System/T/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/User-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      
      cp -rf /home/pi/Amiga/dir/System_ADVSP/System/Temp/* /home/pi/Amiga/dir/System_P96/System/Temp/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Software /home/pi/Amiga/dir/System_P96/System/    
      cp -rf /home/pi/Amiga/dir/Games/Kickstarts /home/pi/Amiga/dir/System_P96/System/Devs/
      #rm -rf /home/pi/Amiga/Install/ClassicWB_UAE_v28/
      
 

if [ ! -f "/home/$USER/Amiga/hdf/ClassicWB_68K_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      cd /home/pi/Amiga/Install
      #get http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      #unzip -u ./ClassicWB_68K_v28.zip
      

      
    else 
      echo " "
    fi 

      
 echo "Ready to fire up Amiga..."     

      

       sudo chmod -R 777 /home/$USER/Amiga
      

   



#***************************************** # Configure Amiga FS-UAE *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga_fs-uae() {
     
      cd /home/$USER/Documents/
      cp -rf /home/$USER/KickOS/Amiga/FS-UAE.zip /home/$USER/Documents/
      unzip -u ./FS-UAE.zip      
      cd /home/$USER/Documents/FS-UAE/

      
           
    
      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      

      mkdir "/home/$USER/Documents/FS-UAE/Hard Drives/"
      cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      
      
      
      
          
      if [ ! -f "/home/$USER/Documents/FS-UAE/Hard Drives/ClassicWB_68K_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
     
      else 
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip -u ./ClassicWB_68K_v28.zip
    
      fi
      
      if [ ! -f "/home/$USER/Documents/FS-UAE/Hard Drives/workbench-311.hdf" ]; then
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      echo "  Configure AmigaForever workbench-311 ...     " 
      echo " "
      echo " "
      
      fi
  
  if [ ! -f "/home/$USER/Documents/FS-UAE/Hard Drives/AROS/AROS.boot" ]; then
      cd /home/$USER/KickOS/Amiga
      unzip -u /home/$USER/KickOS/Amiga/AROS.zip
      mkdir "/home/$USER/Documents/FS-UAE/Hard Drives/AROS/"
     cp -rf /home/$USER/KickOS/Amiga/AROS/* "/home/$USER/Documents/FS-UAE/Hard Drives/AROS/"
  fi
      
      clear
      toilet "KickOS" --metal
   
      echo " "
      echo " "
      if [ ! -f "/home/$USER/Documents/FS-UAE/Kickstarts/Amiga_roms.zip" ]; then
      clear
      toilet -F gay NOTE!
      echo " "
      echo " "
      echo "The roms and workbench files are under copyrigt! "
      echo " "
      echo " "
      echo "Use only if you have the original!  "
      echo " (Original Amiga, Amiga Forever,..."
      echo " "
      echo "The structure in the "Amiga" folder is adapted to Amiga Forever."
      echo " "
      echo " "
      cd /home/$USER/Documents/FS-UAE/Kickstarts/
      wget https://misapuntesde.com/res/Amiga_roms.zip
     
      unzip -u ./Amiga_roms.zip
      rm ./Amiga_roms.zip
      fi
        

      
      
     cp -rf /home/$USER/KickOS/Amiga/conf/* /home/$USER/Amiga/conf/ 
     

      
      
      sudo chmod -R 777 /home/$USER/Amiga
    }    
   

    
#****************************************   #KickOS_Addons  ****************************************************
#****************************************************************************************************************

KickOS_Addons() {

      
   
    
      cd ~/KickOS/config/
      
      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      
      
      
      
     
       
       if [ ! -d /home/$USER/.config/GIMP/ ]; then
#
      clear
      # Update is running
      
      sudo apt install -y gimp 
       clear
       toilet "KickOS" --metal
       toilet -F gay PhotoGimp
       
       curl -L "https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip" -o /home/$USER/KickOS/PhotoGIMP.zip && unzip /home/$USER/KickOS/PhotoGIMP.zip -d /home/$USER/KickOS/ 
       sudo cp -R /home/$USER/KickOS/PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak/.var/app/org.gimp.GIMP/config/* ~/.config
       echo " PhotoGimp by Diolinux installed..."
      
 
      else 
      
      echo " Gimp is already installed..."
      
     
          
      fi     
       
       
       
}

     
#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
KickOS_Retropie() {
#Install Retropie/Setup

      
    

      

if [ ! -f "/opt/retropie/supplementary/emulationstation/emulationstation" ]; then     
    echo " "
      clear
      toilet "KickOS" --metal
      echo " "
      echo "  ... here comes Retropie :-)     "   
      echo " "
      echo " "
      cd
      git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      cd /home/$USER/RetroPie-Setup/ 
      sudo __nodialog=1 ./retropie_packages.sh setup binaries
     
      sudo __nodialog=1 ./retropie_packages.sh setup basic_install
     
       clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      sudo git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
      
      cd /home/$USER/KickOS/Retropie/
      sudo unzip -u /home/$USER/KickOS/Retropie/data.zip
      cp -rf /home/$USER/KickOS/Retropie/roms/* /home/$USER/RetroPie/roms
  
      cp $HOME/games/vice/IMAGES/prg/* /home/$USER/RetroPie/roms/c64/    
      
      
      
      if [ ! -f /home/$USER/RetroPie/BIOS/extract_to_sytem_folder.zip ]; then
      clear
      toilet -F gay Retropie 
      echo " "
      echo " "
      echo "  Add Retropie Bios Files from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/BIOS/
      wget https://archive.org/download/retroarch_bios_pack/extract_to_sytem_folder.zip
      unzip -u /home/$USER/RetroPie/BIOS/extract_to_sytem_folder.zip
      #rm /home/$USER/KickOS/Retropie/Romset.zip
      fi
      else 
      clear
      
      fi
      #-----Config Amiberry for Retropie
  
      
      sudo cp -rf /home/$USER/Amiga/kickstarts/* /home/$USER/RetroPie/BIOS/
      
      sudo cp -rf /home/$USER/KickOS/Retropie/es_settings.cfg /opt/retropie/configs/all/emulationstation/
      sudo cp -rf /home/$USER/KickOS/Retropie/es_systems.cfg /etc/emulationstation/
      cp -rf /home/$USER/KickOS/config/KickOS.mp4  /home/$USER/RetroPie/splashscreens/
      sudo cp -rf /home/$USER/KickOS/Retropie/splashscreen.list  /etc/
      
      
      sudo chmod -R 777 /home/$USER/RetroPie/
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      sudo chmod -R 777 /opt/retropie/
      sudo chmod -R 777 /etc/emulationstation/
      
    
    
  
}


#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

 clear
      toilet "KickOS" --metal

      echo " "
      echo " "
case $CHOICE in
        
        1)
            KickOS_Update
            #KickOS_Tools
            KickOS_Desktop
            #KickOS_FS-UAE
	    #Configure_Amiga_fs-uae
	    KickOS_WinUAE
            Configure_Amiga
	    #KickOS_Addons
            
       ;;
        2)
            KickOS_Update
            KickOS_Tools
            KickOS_Desktop
	    #KickOS_Office 
            KickOS_FS-UAE
	    KickOS_WinUAE
	    #Configure_Amiga_fs-uae
            Configure_Amiga
            #KickOS_Addons
            KickOS_Retropie
            
	    
       ;;
        
        3)
            KickOS_Update
            KickOS_Tools
            KickOS_Desktop
	    KickOS_Office 
            KickOS_FS-UAE
	    KickOS_WinUAE
	    #Configure_Amiga_fs-uae
            Configure_Amiga
            KickOS_Addons
            KickOS_Retropie
            
	   
           
       ;;
                  

esac


      clear
      toilet "KickOS" --metal

      echo " "
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/KickOS/scripts/.bashrc /home/$USER/.bashrc
      sudo rm -rf ~/.local/share/Trash/
      sudo rm -rf ~/.cache/
      #sudo rm -rf ~/.config/chromium/
      sudo rm -rf ~/KickOS
      sudo rm -rf ~/amigafonts/
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

 clear
      toilet "KickOS" --metal

      echo " "
     
echo "KickOS ROM Operating System and Libraries" 
echo "Copyrigt r 2020-2021 KickOS"
echo "All Rights Reserved. B.Titze"
echo "1.>  "
echo "Type'd; to boot into KickOS Workbench"
echo "1.>  "
echo "1.>  "
echo "1.>  ( a ) Start Amiga                           " 
echo "1.>  ( d ) KickPi Desktop                        " 
echo "1.>  ( e ) Emulationstation             (RetroPi)" 
echo "1.>  ( r ) Emulationstation Setup                "
echo "1.>  ( u ) KickPi-OS Update                      " 
echo "1.>  ( m ) Kick-OS Menu                          " 
echo "1.>  "
#startx
 sudo raspi-config nonint do_boot_behaviour B2
