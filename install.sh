#!/bin/sh

echo "yay and sddm are not installed. Installing..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Prompt for installation type
echo "What type of installation do you want?"
echo "1) full installation (extra utilities)"
echo "2) minimal installation"
read -p "Enter the number of your choice: " choice

case $choice in
  1)
    echo "Installing full installation."
    yay -S --needed - < packages-full
    ;;
  2)
    echo "Installing minimal installation."
    yay -S --needed - < packages-min
    ;;
  *)
    echo "Invalid choice. Installing minimal installation."
    yay -S --needed - < packages-min
    ;;
esac

echo "Installing Catppuccin Mocha theme..."
mkdir ~/.themes
unzip ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark.zip
cp -r ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark ~/.themes/
echo "Catppuccin Mocha theme has been installed successfully."

#Prompt to install Open WebUI
echo "Would you like to install Open WebUI for running local LLM's?"
echo "1. Yes"
echo "2. No"
printf "Enter your choice: "
read choice

if [ "$choice" = "1" ]; then
    echo "Installing Open WebUI..."
    chmod +x Open-WebUI/open-webui.sh
    ./Open-WebUI/open-webui.sh
elif [ "$choice" = "2" ]; then
    echo "Installation cancelled."
else
    echo "Invalid choice. Please enter 1 or 2."
fi

systemctl enable sddm
systemctl enable bluetooth.service
systemctl start bluetooth.service

echo "Installing config files"
mv ~/hypr/config/* ~/.config/
chmod +x ~/.config/scripts/hyprlock-greeter.sh  
chmod +x ~/.config/scripts/wireless-menu.sh
chmod +x ~/.config/scripts/ollama-waybar.sh
sudo cp -r ~/.config/wlogout/icons/ /usr/share/wlogout/
echo "Installation has completed. Reboot your system. Have fun!!"
