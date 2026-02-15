#!/bin/bash
# setup-aws.sh - Instalación de AWS CLI para ARM64

echo "☁️ Instalando AWS CLI..."

# Descargar AWS CLI para ARM64
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

# Instalar unzip si es necesario
sudo apt install -y unzip

# Descomprimir
unzip awscliv2.zip

# Instalar
sudo ./aws/install

# Limpiar
rm -rf awscliv2.zip aws/

# Verificar
aws --version
echo "✅ AWS CLI instalado correctamente"
