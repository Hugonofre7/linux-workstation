# 🔒 Seguridad en Ubuntu Server

## 📋 Índice
1. [SSH Hardening](#ssh-hardening)
2. [Firewall (UFW)](#firewall-ufw)
3. [Fail2Ban](#fail2ban)
4. [Actualizaciones de Seguridad](#actualizaciones-de-seguridad)
5. [Auditoría Básica](#auditoría-básica)
6. [Buenas Prácticas](#buenas-prácticas)

---

## 🔐 SSH Hardening

### Configuración segura de SSH
```bash
# Cambiar puerto SSH a 2222
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

# Deshabilitar login root
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# Deshabilitar autenticación por contraseña (solo claves)
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Reiniciar servicio
sudo systemctl restart ssh

# Verificar
sudo sshd -t && echo "✅ Configuración válida"

Copiar clave SSH (desde Desktop)
ssh-copy-id -p 2222 usuario@IP-DEL-SERVIDOR

🔥 Firewall (UFW)
# Verificar estado
sudo ufw status

# Configurar reglas por defecto
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir SSH en puerto personalizado
sudo ufw allow 2222/tcp comment 'SSH seguro'

# Activar firewall
sudo ufw --force enable

# Verificar
sudo ufw status verbose

🛡️ Fail2Ban
sudo apt update
sudo apt install -y fail2ban

# Crear archivo de configuración local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Configurar protección SSH (puerto 2222)
sudo tee /etc/fail2ban/jail.local > /dev/null << 'EOF'
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3

[sshd]
enabled = true
port = 2222
logpath = %(sshd_log)s
backend = systemd
maxretry = 3
bantime = 3600
EOF

Habilitar e iniciar
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

Verificar estado
# Estado del servicio
sudo systemctl status fail2ban

# Ver reglas activas
sudo fail2ban-client status

# Ver estadísticas SSH
sudo fail2ban-client status sshd

# Ver IPs baneadas
sudo fail2ban-client banned

🔄 Actualizaciones de Seguridad
# Instalar paquete
sudo apt install -y unattended-upgrades

# Configurar
sudo dpkg-reconfigure -plow unattended-upgrades

Verificar configuración
# Ver archivo de configuración
cat /etc/apt/apt.conf.d/50unattended-upgrades

# Verificar que está activo
systemctl status unattended-upgrades

Actualizaciones manuales
# Ver actualizaciones disponibles
sudo apt list --upgradable

# Aplicar actualizaciones de seguridad
sudo apt update && sudo apt upgrade -y

# Verificar
sudo apt autoremove -y
sudo apt autoclean

🔍 Auditoría Básica
# Instalar
sudo apt install -y lynis

# Ejecutar auditoría básica
sudo lynis audit system

# Auditoría específica
sudo lynis audit system --quick

Chkrootkit - Detección de rootkits
# Instalar
sudo apt install -y chkrootkit

# Ejecutar
sudo chkrootkit

Rkhunter - Otra herramienta de rootkits
# Instalar
sudo apt install -y rkhunter

# Actualizar base de datos
sudo rkhunter --update

# Ejecutar comprobación
sudo rkhunter --check --skip-keypress

Logs de seguridad
# Ver intentos de login fallidos
sudo grep "Failed password" /var/log/auth.log | tail -20

# Ver accesos exitosos
sudo grep "Accepted password" /var/log/auth.log | tail -10

# Ver logs en tiempo real
sudo tail -f /var/log/auth.log

📋 Buenas Prácticas
1. Usuarios y Permisos
# Crear usuario con permisos sudo (si no existe)
sudo adduser usuario
sudo usermod -aG sudo usuario

# Verificar usuarios con sudo
sudo grep -Po '^sudo.+:\K.*$' /etc/group

2. Contraseñas seguras
# Instalar herramienta de calidad de contraseñas
sudo apt install -y libpam-pwquality

# Configurar política de contraseñas
sudo nano /etc/pam.d/common-password
# Agregar: password requisite pam_pwquality.so retry=3 minlen=12 difok=3

3. Logs centralizados (opcional)
# Instalar rsyslog
sudo apt install -y rsyslog

# Configurar forwarding (opcional)
sudo nano /etc/rsyslog.conf

4. Backup de configuraciones de seguridad
# Crear backup
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup.$(date +%Y%m%d)
sudo cp /etc/fail2ban/jail.local /etc/fail2ban/jail.local.backup.$(date +%Y%m%d)

✅ Verificación de Seguridad
echo "=== VERIFICACIÓN DE SEGURIDAD ==="

# SSH
sudo grep "Port" /etc/ssh/sshd_config
sudo grep "PermitRootLogin" /etc/ssh/sshd_config

# Firewall
sudo ufw status | grep -q "active" && echo "✅ Firewall activo"

# Fail2Ban
sudo systemctl is-active fail2ban >/dev/null && echo "✅ Fail2Ban activo"

# Actualizaciones
sudo unattended-upgrades --dry-run --debug | grep -q "Allowed origins" && echo "✅ Unattended upgrades configurado"

⚠️ Troubleshooting de Seguridad
Problema: No puedo conectar por SSH
# Verificar puerto
sudo netstat -tlnp | grep 2222

# Verificar firewall
sudo ufw status | grep 2222

# Verificar servicio
sudo systemctl status ssh

Problema: Fail2Ban no bloquea
# Verificar logs
sudo tail -f /var/log/fail2ban.log

# Reiniciar servicio
sudo systemctl restart fail2ban