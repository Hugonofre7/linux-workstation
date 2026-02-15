#!/bin/bash
# setup-docker.sh - Instalación de Docker en Ubuntu Desktop ARM64

echo "🐳 Instalando Docker..."

# Actualizar sistema
sudo apt update

# Instalar dependencias
sudo apt install -y ca-certificates curl

# Agregar clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Agregar repositorio
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Agregar usuario al grupo docker
sudo usermod -aG docker $USER

# Verificar instalación
docker --version
echo "✅ Docker instalado. Ejecuta 'newgrp docker' o reinicia sesión para aplicar cambios."
