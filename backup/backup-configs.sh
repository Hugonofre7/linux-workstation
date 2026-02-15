#!/bin/bash
# backup-configs.sh - Backup de configuraciones importantes

BACKUP_DIR="/home/$(whoami)/backups"
DATE=$(date +%Y%m%d_%H%M%S)

echo "📦 Iniciando backup de configuraciones..."

# Crear directorio si no existe
mkdir -p $BACKUP_DIR

# Configuraciones a respaldar
CONFIGS=(
    "/etc/ssh/sshd_config"
    "/etc/fail2ban"
    "/etc/ufw"
    "/etc/netplan"
    "/home/$(whoami)/.ssh"
    "/home/$(whoami)/scripts"
    "/home/$(whoami)/backup"
)

# Crear backup
tar -czf $BACKUP_DIR/config-backup-$DATE.tar.gz "${CONFIGS[@]}" 2>/dev/null

echo "✅ Backup completado: $BACKUP_DIR/config-backup-$DATE.tar.gz"
echo "📊 Tamaño: $(du -h $BACKUP_DIR/config-backup-$DATE.tar.gz | cut -f1)"