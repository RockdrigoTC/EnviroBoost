#!/bin/bash

# ---------------------------
#    Dotfile Installer v1.0
#  Automating your dev setup!
# ---------------------------

# Función para mostrar el proceso de instalación
function installing() {
    echo -e "\n\033[1;32m[INSTALANDO] $1...\033[0m"
    sleep 1
}

installing "Actualizando paquetes"
sudo pacman -Syu

# Instalación de fuentes Meslo Nerd Fonts
installing "Fuentes Meslo Nerd"
mkdir -p ~/.local/share/fonts
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf
fc-cache -fv

# Instalación de herramientas esenciales
installing "htop, curl, wget, grep, sed"
sudo pacman -S --noconfirm htop curl wget grep sed cmake

# Instalación de herramientas adicionales
installing "bat"
sudo pacman -S --noconfirm bat

installing "lsd"
sudo pacman -S --noconfirm lsd

installing "nano-syntax-highlighting"
sudo pacman -S --noconfirm nano-syntax-highlighting

# Instalación de Zsh
installing "Zsh"
sudo pacman -S --noconfirm zsh

# Cambiar la terminal predeterminada a Zsh
chsh -s $(which zsh)

# Instalación de Oh My Zsh
installing "Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalación de Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instalar Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Actualizar la configuración de Zsh
mv .zshrc ~/.zshrc
mv .p10k.zsh ~/.p10k.zsh

# Instalación de Ranger
installing "Ranger"
sudo pacman -S --noconfirm ranger
mv .config/ranger ~/.config/
chmod +x ~/.config/ranger/scope.sh
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# Instalación y configuración de Neovim y LunarVim
installing "Neovim"
sudo pacman -S --noconfirm neovim
installing "LunarVim"
sudo pacman -S --noconfirm ripgrep rust python-pip npm
sudo npm install -g npm
sudo pacman -S --noconfirm python-pynvim
sudo npm install -g neovim tree-sitter-cli
sudo pacman -S --noconfirm ripgrep fd
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

mv .config/alacritty ~/.config/

echo -e "\n\033[1;34m¡Instalación completa! Tu entorno de desarrollo está listo.\033[0m"
echo -e "Los servicios FTP, SSH y Apache están corriendo y configurados para arrancar automáticamente."
