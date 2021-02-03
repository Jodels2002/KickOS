#!/bin/bash
#
# Description : Compile cool-retro-term based on QT5
# Author      : Jose Cerrejon Gonzalez (ulysess@gmail_dot._com)
# Version     : 1.0.0 (13/Aug/20)
#
. ./scripts/helper.sh || . ../helper.sh || . ./helper.sh || wget -q 'https://github.com/jmcerrejon/PiKISS/raw/master/scripts/helper.sh'
clear
check_board || { echo "Missing file helper.sh. I've tried to download it for you. Try to run the script again." && exit 1; }

PACKAGES_DEV=(qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-localstorage qml-module-qtquick-window2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel)
GITHUB_PATH="https://github.com/Swordfish90/cool-retro-term.git"
SHORTCUT_PATH="/usr/share/applications/cool-retro-term.desktop"
ICON_PATH_ORIG="$HOME/sc/cool-retro-term/app/icons/32x32/cool-retro-term.png"
ICON_PATH_DEST="/usr/share/icons/hicolor/32x32/apps/cool-retro-term.png"

runme() {
	if [ ! -f /usr/bin/cool-retro-term ]; then
		echo -e "\nFile does not exist.\n· Something is wrong.\n· Try to install again."
		exit_message
	fi
	read -p "Press [ENTER] to run the app..."
	cool-retro-term
	exit_message
}

fix_icon() {
    echo -e "\nFixing shortcut icon..."
    sudo cp -f "$ICON_PATH_ORIG" "$ICON_PATH_DEST"
    sudo sed -i 's/Icon=cool-retro-term/Icon=\/usr\/share\/icons\/hicolor\/32x32\/apps\/cool-retro-term.png/g' "$SHORTCUT_PATH"
}

compile() {
	sudo apt install -y "${PACKAGES_DEV[@]}"
	mkdir -p "$HOME"/sc && cd "$_"
	echo "Cloning and compiling repo..."
    if [[ ! -d "$HOME"/sc/cool-retro-term ]]; then
	    git clone --recursive "$GITHUB_PATH" cool-retro-term
    fi
    cd "$HOME"/sc/cool-retro-term
    qmake && make -j"$(nproc)" OPTOPT="-march=armv8-a+crc -mtune=cortex-a53"
    sudo make install
    fix_icon
    echo -e "\nDone!. Type cool-retro-term or go to Menu > System tools > Cool Retro Term."
    runme
}

echo "Compile cool-retro-term based on QT5"
echo "===================================="
echo
echo " · Estimated Time on Raspberry Pi 4 (not overclocked): ~2 minutes"
echo " · It's very cool, but I warn you: Pkg dependencies takes ~54 MB and the app in memory takes ~88 MB RAM."
echo " · This app can't be uninstalled by PiKISS if you decide to run this script. Use at your own risk."
echo " · [ALT] + F11 = Full Screen | Right click = Menu"
echo
read -p "Continue (Y/n)? " response

if [[ $response =~ [Nn] ]]; then
	exit_message
fi

compile