
 sudo dpkg --add-architecture i386 
# sudo apt -y install linux-image-686 linux-headers-686

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt update


sudo apt install --install-recommends winehq-stable

wine msiexec /i ~/Desktop/A      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
      
      
      cd
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400_x64.msi
      #wine msiexec /i ~/Desktop/AmigaForever.msi
      wine msiexec /i wine msiexec /i InstallWinUAE4400_x64.msi
