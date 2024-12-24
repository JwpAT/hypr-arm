if command -v yay &> /dev/null; then
	echo "yay is already installed."
else
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
fi
echo "installing requirement"
yay -S --needed - < requirements
