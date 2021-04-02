#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************




#***********************************************  #Preinstall stuff *****************************************
#*************************************************************************************************************
sudo apt-mark hold lxpanel
 
sudo cp -R /home/$USER/KickOS/scripts/* /usr/local/bin
cp -rf  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
sudo apt-get install -y toilet dialog 
clear
   
      
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

OPTIONS=(1 "Install KickOS full  (recommended)           (ca. 50 min)"
	 2 "Install KickOS full + Office Suite           (ca. 70 min)"
         3 "Install KickOS light                         (ca. 30 min)")
        

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
      sudo apt-get -y upgrade

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

          
      sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
      sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      sudo apt install -y  geany geany-plugins-common geany-common zip  unzip xmlstarlet mc
      
      clear
      toilet "KickOS" --metal
      
      #Some little Amiga stuff....
      sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms 
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -rf /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
  
      
}

#*********************************************  #Office  **********************************************
#****************************************************************************************************************

KickOS_Office() {

      clear
      toilet "KickOS" --metal

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      sudo apt install -y imagemagick krita-l10n gparted synaptic
      sudo apt install -y thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk

}


#*********************************************  #Installing KickOS Desktop*********************************
#**********************************************************************************************************
 
 KickOS_Desktop() {
 
 
  
      sudo apt purge -y lxde  lxde-common lxde-core
      sudo apt purge -y raspberrypi-ui-mods
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      
      
      sudo chmod -R 777 /home/$USER/KickOS
      sudo chmod -R 777 /home/$USER/.config
      sudo chmod -R 777 ~/.local
      sudo cp -rf ~/KickOS ~/.KickOS
      sudo rm -rf /home/$USER/.cache
      cd /home/$USER/KickOS/
      cp -rf ~/KickOS/config/Desktop/* /home/$USER/Desktop/

      sudo unzip ~/KickOS/.pac/.data.pac

      sudo chmod -R 777 /home/$USER/KickOS
      sudo chmod -R 777 /home/$USER/.local
      sudo chmod -R 777 /home/$USER/.config
      sudo rm -rf /home/$USER/.cache
      # Fresh install Amiga Desktop
    
if [ ! -f /usr/share/icons/AMIGAOSLINUX.zip ]; then

      cd /usr/share/icons/
      
      sudo cp -rf /home/$USER/KickOS/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip -u  /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      
      else 
      clear
fi     

if [ ! -f /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/KickOS
      git clone --depth=1 https://github.com/x64k/amitk
      sudo cp -rf /home/$USER/KickOS/amitk /usr/share/themes
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo cp -rf /home/$USER/KickOS/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /home/$USER/KickOS/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
      clear
      
fi
  
  
     
  

   
   
       cp -rf ~/KickOS/.data/.config/ /home/$USER/
       cp -rf ~/KickOS/.data/.local/ /home/$USER/  
       sudo raspi-config nonint do_boot_behaviour B4
       

}


#***************************************** # Install FS-UAE  *********************************************
#****************************************************************************************************************
     
     
 KickOS_FS-UAE() {
  
      

 
       echo " "
       echo " "
       echo "  ... here comes FS-UAE 64 bit :-) "
       
       sudo apt install -y fs-uae fs-uae-arcade fs-uae-launcher fs-uae-netplay-server
       sudo apt install -y autoconf automake build-essential gettext libfreetype6-dev libglew-dev libglib2.0-dev libjpeg-dev libmpeg2-4-dev 
       sudo apt install -y libopenal-dev libpng-dev libsdl2-dev libsdl2-ttf-dev libtool libxi-dev 
       sudo apt install -y libxtst-dev zip zlib1g-dev
      
     
      
 

 }


#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga() {
      cd
      mkdir /home/$USER/Documents/FS-UAE/
      mkdir /home/$USER/Documents/FS-UAE/Configurations/
             
      cd /home/$USER/Documents/FS-UAE/

      
           
      if [ ! -f /home/$USER/FS-UAE.zip ]; then
      clear
      toilet "KickOS" --metal
      cd /home/$USER/Documents/FS-UAE/
      cp -rf /home/$USER/KickOS/Amiga/FS-UAE.zip /home/$USER/Documents/
      unzip -u ./FS-UAE.zip
      rm ./FS-UAE.zip
      
      
      else 
      clear
      toilet "KickOS" --metal
      fi
      
      cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      
      
      if [ ! -f "/home/$USER/Documents/FS-UAE/Hard Drives/ClassicWB_P96_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
      cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      unzip -u ./ClassicWB_P96_v28.zip
      else 
      clear
      toilet "KickOS" --metal
      fi
      
          
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


 cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      
      if [ ! -f "/home/$USER/Documents/FS-UAE/Hard Drives/ClassicWB_UAE_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      toilet "full 64bit" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      
      
      if [ ! -f "/home/$USER/Documents/FS-UAE/Hard Drives/ClassicWB_OS39_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      toilet "full 64bit" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...   KickOS full  " 
      echo " "
      echo " "
      cd "/home/$USER/Documents/FS-UAE/Hard Drives/"
      
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip -u ./ClassicWB_OS39_v28.zip
      else 
      clear
      
      fi
      
 

    
      cd ~/KickOS/config/
      
     
      clear
      toilet "KickOS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      ./retro-term.sh
      
      
      clear
      toilet "KickOS" --metal
      toilet "full" --metal
      echo " "
      echo " "
     
      
      
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

case $CHOICE in
        
        1)
            #Poser
            KickOS_Tools
            KickOS_Desktop
            KickOS_FS-UAE
            Configure_Amiga
            KickOS_Addons
            KickOS_Retropie
            KickOS_Update
       ;;
        2)
            #Poser
            KickOS_Tools
            KickOS_Desktop
            KickOS_FS-UAE
            Configure_Amiga
            KickOS_Addons
            KickOS_Retropie
            KickOS_Office 
	    KickOS_Update
       ;;
        
        3)
           
            #Poser
            KickOS_Tools
            KickOS_Desktop
            KickOS_FS-UAE
            Configure_Amiga
	    KickOS_Update
           
       ;;
                  

esac


echo " "
      echo " "
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/KickOS/scripts/.bashrc /home/$USER/.bashrc
      sudo rm -rf ~/.local/share/Trash/
      sudo rm -rf ~/.cache/
      sudo rm -rf ~/.config/chromium/
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

startx
