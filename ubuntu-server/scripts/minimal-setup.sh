#!/bin/bash
# minimal-setup.sh - Configuración mínima para Ubuntu Server

echo "🚀 Configurando Ubuntu Server..."

# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar herramientas esenciales
sudo apt install -y \
  curl \
  wget \
  git \
  vim \
  htop \
  tree \
  net-tools \
  software-properties-common

# Configurar zona horaria
sudo timedatectl set-timezone America/Mexico_City

echo "✅ Configuración mínima completada"
echo "ℹ️  Ejecuta './secure-ssh.sh' para configurar SSH seguro"