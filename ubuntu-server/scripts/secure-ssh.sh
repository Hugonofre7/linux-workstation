#!/bin/bash
# secure-ssh.sh - Configuración SSH segura para Ubuntu Server

echo "🔒 Configurando SSH seguro..."

# Cambiar puerto SSH a 2222
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

# Deshabilitar login root
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# Solo autenticación por clave
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Reiniciar servicio SSH
sudo systemctl restart ssh

# Configurar firewall
sudo ufw allow 2222/tcp
sudo ufw --force enable

echo "✅ SSH configurado en puerto 2222"
echo "🔐 Firewall activado"
