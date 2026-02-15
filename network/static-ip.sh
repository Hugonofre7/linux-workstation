#!/bin/bash
# static-ip.sh - Configurar IP estática en Ubuntu Server

echo "🔧 Configurando IP estática..."

# Detectar interfaz de red principal
INTERFAZ=$(ip route | grep default | awk '{print $5}')
echo "📡 Interfaz detectada: $INTERFAZ"

# Solicitar datos al usuario
read -p "🌐 IP deseada (ej. 000.000.0.000/24): " IP
read -p "🚪 Gateway (ej. 000.000.0.0): " GATEWAY
read -p "📡 DNS primario (ej. 8.8.8.8): " DNS1
read -p "📡 DNS secundario (ej. 8.8.4.4): " DNS2

# Crear backup de configuración actual
sudo cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.backup 2>/dev/null

# Crear nueva configuración
sudo tee /etc/netplan/01-netcfg.yaml > /dev/null <<EOF
network:
  version: 2
  ethernets:
    $INTERFAZ:
      dhcp4: no
      addresses:
        - $IP
      gateway4: $GATEWAY
      nameservers:
        addresses: [$DNS1, $DNS2]
EOF

# Aplicar configuración
sudo netplan apply

echo "✅ IP estática configurada: $IP"
echo "📡 Interfaz: $INTERFAZ"
echo "🚪 Gateway: $GATEWAY"
echo "📡 DNS: $DNS1, $DNS2"
echo ""
echo "ℹ️  Para verificar: ip a"