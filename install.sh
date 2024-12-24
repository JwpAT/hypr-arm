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

mkdir ~/.themes

curl -fsSL https://ollama.com/install.sh | sh

echo "installing requirement"
yay -S --needed - < requirements

echo "Extracting Kripton theme..."
tar -xf ~/hyprland1/Kripton.tar.xz
mv ~/hyprland1/Kripton ~/.themes/

echo "Kripton theme has been installed successfully."

echo "Installing config files"
mv ~/hyprland1/config/* ~/.config/

echo "Installation has completed. Reboot your fucking system and don't break it, or else you'll have to deal with me again. Have fun faggot."
