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
sudo apt update && sudo apt upgrade

# Instalación de fuentes Meslo Nerd Fonts
installing "Fuentes Meslo Nerd"
mkdir -p ~/.local/share/fonts
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O ~/.local/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf
fc-cache -fv

# Instalación de herramientas esenciales
installing "htop, curl, wget, grep, sed, cmake"
sudo apt install -y htop curl wget grep sed cmake

# Instalación de herramientas adicionales
installing "bat"
sudo apt install -y bat

installing "lsd"
sudo apt install -y lsd

# Instalación de Zsh
installing "Zsh"
sudo apt install -y zsh

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
installing "Ranger y dependencias"
sudo apt install -y ranger python3-pynvim
mv .config/ranger ~/.config/

# Instalación de FTP
installing "FTP (vsftpd)"
sudo apt install -y vsftpd

# Configuración y activación del servicio FTP
installing "Configurando FTP"
sudo service vsftpd start
sudo service vsftpd enable

# Instalación y configuración de SSH
installing "SSH (OpenSSH)"
sudo apt install -y openssh-server

# Iniciar el servicio SSH
sudo service ssh start
sudo service ssh enable

# Instalación y configuración de Neovim 
installing "Neovim"
# Instalación de Neovim
sudo apt install -y neovim
mv .config/nvim ~/.config/

# Instalación de herramientas de desarrollo
installing "Python y herramientas relacionadas"
sudo apt install -y python3 python3-pip python3-venv

installing "Compilador C y C++"
sudo apt install -y build-essential

installing "Servidor web Apache"
sudo apt install -y apache2

# Verificación de Apache y activación del servicio
installing "Verificando y configurando Apache"
sudo service apache2 status
sudo service apache2 start

echo -e "\n\033[1;34m¡Instalación completa! Tu entorno de desarrollo está listo.\033[0m"
echo -e "Los servicios FTP, SSH y Apache están corriendo y configurados para arrancar automáticamente."
