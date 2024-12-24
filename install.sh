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

echo "installing packages"
yay -S --needed - < packages

echo "Extracting Kripton theme..."
tar -xf ~/hypr/Kripton.tar.xz
mv ~/hypr/Kripton ~/.themes/

echo "Kripton theme has been installed successfully."

curl -fsSL https://ollama.com/install.sh | sh

echo "Installing config files"
mv ~/hypr/config/* ~/.config/

echo "Installation has completed. Reboot your fucking system. Have fun!!"

echo "          / \ "
echo "         |\_/| "
echo "         |---| "
echo "         |   | "
echo "         |   | "
echo "       _ |=-=| _ "
echo "   _  / \|   |/ \ "
echo "  / \|   |   |   ||\ "
echo " |   |   |   |   | \> "
echo " |   |   |   |   |   \ "
echo " | -   -   -   - |)   ) "
echo " |                   / "
echo "  \                 / "
echo "   \               / "
echo "    \             / "
echo "     \           / "
