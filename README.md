# KickOS



KickOS is aimed at Amiga friends who want to revive the Amiga experience for Desktop.
The focus of KickOS is easy handling and Workbench like "Look and feel" :-)



It is a side project of my Amiga 3000 mini to print yourself. But I think it's also interesting for other Amiga friends.

# Disclaimer

The whole thing here is a hobby project. Use at your own risk ;-)
I'm far from being good at scripting ;-) It works.

But: if someone has suggestions for improvement, constructive criticism or whatever - bring them on. 
A warm welcome

Greetings Bernd
bernd.titze@me.com


# Preparation:



Optional for Amiga Forever owners:
- Format a USB stick ( FAT32, Volume Label "AMIGA" )
- Copy the "Shared" folder from the Amiga Forever installation
-> "AMIGA/Shared/*here are your AmigaForever files*"

# Installation:

You can install KickOS as your computer’s main operating system, run it in a virtual machine, or create a USB stick or other medium from which you can run it when required.


https://downloads.raspberrypi.org/rpd_x86/images/rpd_x86-2021-01-12/2021-01-11-raspios-buster-i386.iso

Setup Pi OS and open a terminal window and type following commands:



git clone --depth=1 https://github.com/Jodels2002/KickOS.git

sudo chmod -R 777 KickOS

cd KickOS

./setup.sh

# Update

To bring KickPi-OS up to date, just type "m" + return in the cammand line. Then use the point "u Update KickPi-OS"

# Retropie:
To use Retropie just copy your Bios and Rom files into the (Home) Retropie folder. 
See also: https://retropie.org.uk/docs/First-Installation/


# Used 3rd party tools:




RetroPie
https://github.com/RetroPie




Source of Game:

https://amigaland.de/1318-2

All games are subject to the copyrights of the respective manufacturer, Amigaland.de has a license for all games offered here, which allows these Amiga games to be offered for free download. These games are for private use only and may not be used commercially! 
