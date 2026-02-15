#!/bin/bash
# setup-k8s.sh - Instalación de herramientas Kubernetes en ARM64

echo "☸️ Instalando Kubernetes tools..."

# Instalar kubectl
echo "Instalando kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Instalar Helm
echo "Instalando Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Instalar Stern (logs multicontenedor)
echo "Instalando Stern..."
curl -LO https://github.com/stern/stern/releases/download/v1.27.0/stern_1.27.0_linux_arm64.tar.gz
tar -xzf stern_1.27.0_linux_arm64.tar.gz
sudo mv stern /usr/local/bin/stern
rm stern_1.27.0_linux_arm64.tar.gz

# Verificar instalaciones
echo "✅ Versiones instaladas:"
kubectl version --client
helm version
stern --version
echo "✅ Kubernetes tools instalados correctamente."
