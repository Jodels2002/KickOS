#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************


#***********************************************  #Preinstall stuff *****************************************

if [ ! -d /home/$USER/.backup/ ]; then
mkdir /home/$USER/.backup/
fi
 
sudo cp -R /home/$USER/KickOS/scripts/* /usr/local/bin

cp -rf  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
sudo apt-get install -y toilet dialog 


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
      
      #sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session lightdm
      #sudo apt purge -y raspberrypi-ui-mods 
      #sudo apt purge -y cups cups-client cups-common cups-server-common
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



wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key


sudo apt-get install -y software-properties-common

sudo apt-add-repository 'deb http://dl.winehq.org/wine-builds/debian/ buster main'
sudo apt update
#sudo apt upgrade


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
            KickOS_Tools
            KickOS_Desktop
            KickOS_FS-UAE
	    #Configure_Amiga_fs-uae
	    KickOS_WinUAE
            #Configure_Amiga
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
            #Configure_Amiga
            #KickOS_Addons
           # KickOS_Retropie
            
	    
       ;;
        
        3)
            KickOS_Update
            KickOS_Tools
            KickOS_Desktop
	    #KickOS_Office 
            KickOS_FS-UAE
	    KickOS_WinUAE
	    #Configure_Amiga_fs-uae
            #Configure_Amiga
            #KickOS_Addons
          
            
	   
           
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
