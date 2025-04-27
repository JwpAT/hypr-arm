echo "yay and sddm are not installed. Installing..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Prompt for installation type
echo "What type of istallation do you want?"
echo "1) full installation (extra utilities)"
echo "2) minimal installation"
read -p "Enter the number of your choice: " choice

case $choice in
  1)
    echo "Installing minimal installation."
    yay -S --needed - < packages-min
    ;;
  2)
    echo "Installing full installation."
    yay -S --needed - < packages-full
    ;;
  *)
    echo "Invalid choise. Installing minimal installation."
    yay -S --needed - < packages-min
    ;;
esac

echo "Installing Catppuccin Mocha theme..."
mkdir ~/.themes
unzip ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark.zip
cp -r ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark ~/.themes/
echo "Catppuccin Mocha theme has been installed successfully."

# Prompt to choose LLM
echo "Would you like the install an Ollama local LLM?"
echo "1) llama3.2:1b (1.3GB)"
echo "2) llama3.2 (2.0GB)"
echo "3) Skip LLM installation. Recommended for minimal installation."
read -p "Enter the number of your choice: " choice

case $choice in
  1)
    echo "Downloading llama3.2:1b..."
    curl -fsSL https://ollama.com/install.sh | sh
    ollama pull llama3.2:1b
    ;;
  2)
    echo "Downloading llama3.2..."
    curl -fsSL https://ollama.com/install.sh | sh
    ollama pull llama3.2
    ;;
  3)
    echo "Skipping LLM download"
    ;;
  *)
    echo "Invalid choice. Skipping LLM download."
    ;;
esac

systemctl enable sddm
systemctl enable bluetooth.service
systemctl start bluetooth.service

echo "Installing config files"
mv ~/hypr/config/* ~/.config/
chmod +x ~/.config/scripts/hyprlock-greeter.sh
chmod +x ~/.config/scripts/wireless-menu.sh
sudo cp -r ~/.config/wlogout/icons/ /usr/share/wlogout/

echo "Installation has completed. Reboot your system. Have fun!!"
