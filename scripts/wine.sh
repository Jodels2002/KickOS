
# sudo dpkg --add-architecture i386 && sudo apt update
# sudo apt -y install linux-image-686 linux-headers-686



sudo apt -y install gnupg2 software-properties-common
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository https://dl.winehq.org/wine-builds/debian/
sudo apt update
sudo apt install --install-recommends wine

wine msiexec /i ~/Desktop/A      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
      
      
      cd
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400_x64.msi
      #wine msiexec /i ~/Desktop/AmigaForever.msi
      wine msiexec /i wine msiexec /i InstallWinUAE4400_x64.msi
