#!/bin/bash
# setup-terraform.sh - Instalación de Terraform para ARM64

echo "🏗️ Instalando Terraform..."

# Descargar Terraform ARM64
wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_arm64.zip

# Instalar unzip si es necesario
sudo apt install -y unzip

# Descomprimir y mover
unzip terraform_1.7.4_linux_arm64.zip
sudo mv terraform /usr/local/bin/

# Limpiar
rm terraform_1.7.4_linux_arm64.zip

# Verificar
terraform version
echo "✅ Terraform instalado en /usr/local/bin/terraform"
