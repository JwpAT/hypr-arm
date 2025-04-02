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

curl -fsSL https://ollama.com/install.sh | sh

echo "Installing config files"
mv ~/hypr/config/* ~/.config/
chmod +x ~/.config/hypr/hyprlock-greeter.sh
sudo cp -r ~/.config/wlogout/icons/ /usr/share/wlogout/

echo "Installation has completed. Reboot your system. Have fun!!"
