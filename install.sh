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

echo "Extracting Catppuccin Mocha theme..."
unzip ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark.zip
mv ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark/ ~/.themes/

echo "Catppuccin Mocha theme has been installed successfully."

curl -fsSL https://ollama.com/install.sh | sh

echo "Installing config files"
mv ~/hypr/config/* ~/.config/

chmod +x ~/.config/hypr/hyprlock-greeter.sh

echo "Installation has completed. Reboot your system. Have fun!!"
