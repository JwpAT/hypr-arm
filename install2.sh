echo "istalling yay and sddm"
sudo -i pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
pacman -S sddm
sudo systemctl enable sddm
echo "yay and sddm have been installed successfully."

echo "installing packages"
yay -S --needed - < packages

echo "installing Catppuccin Mocha theme..."
mkdir ~/.themes
unzip ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark.zip
cp -r ~/hypr/Catppuccin-Mocha-Standard-Blue-Dark ~/.themes/
echo "Catppuccin Mocha theme has been installed successfully."

echo "downloading Ollama3 local LLM"
curl -fsSL https://ollama.com/install.sh | sh

echo "installing config files"
mv ~/hypr/config/* ~/.config/
chmod +x ~/.config/hypr/hyprlock-greeter.sh
cp -r ~/.config/wlogout/icons/ /usr/share/wlogout/

echo "Installation has completed. Reboot your system. Have fun!!"
