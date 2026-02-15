#!/bin/bash
# post-install.sh - Script post-instalación Ubuntu Desktop

echo "🖥️ Configurando Ubuntu Desktop..."

# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar herramientas básicas
sudo apt install -y \
  curl \
  wget \
  git \
  vim \
  htop \
  tree \
  net-tools \
  software-properties-common \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release

# Configurar zona horaria (México como ejemplo)
sudo timedatectl set-timezone America/Mexico_City

# Configurar teclado español
sudo localectl set-keymap es
sudo localectl set-x11-keymap es

echo "✅ Post-instalación completada"
echo "ℹ️  Ejecuta los scripts específicos para instalar herramientas DevOps"