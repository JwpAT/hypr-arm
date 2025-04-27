echo "yay and sddm are not installed. Installing..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
sudo pacman -S sddm
systemctl enable sddm
echo "yay and sddm have been installed successfully."

echo "installing packages"
yay -S --needed - < packages

echo "Installing Catppuccin Mocha theme..."
mkdir ~/.themes
unzip ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark.zip
cp -r ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark ~/.themes/
echo "Catppuccin Mocha theme has been installed successfully."

systemctl enable bluetooth.service
systemctl start bluetooth.service 

# Prompt to choose LLM
echo "Would you like the install an LLM?"
echo "1) llama3.2:1b (Smaller, Faster)"
echo "2) llama3.2 (Larger, Slower)"
echo "3) skip LLM installation
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

echo "Installing config files"
mv ~/hypr/config/* ~/.config/
chmod +x ~/.config/scripts/hyprlock-greeter.sh
chmod +x ~/.config/scripts/wireless-menu.sh
sudo cp -r ~/.config/wlogout/icons/ /usr/share/wlogout/

echo "Installation has completed. Reboot your system. Have fun!!"
