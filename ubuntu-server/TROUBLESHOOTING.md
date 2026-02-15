# 🔧 Troubleshooting - Ubuntu Server

## 📋 Índice de Problemas Comunes

1. [SSH no conecta](#ssh-no-conecta)
2. [Contenedores no inician](#contenedores-no-inician)
3. [Servidor lento](#servidor-lento)
4. [Firewall bloquea servicios](#firewall-bloquea-servicios)
5. [No hay espacio en disco](#no-hay-espacio-en-disco)
6. [Base de datos no responde](#base-de-datos-no-responde)
7. [Problemas de red](#problemas-de-red)
8. [Backups fallan](#backups-fallan)

---

## 🔐 SSH no conecta

### Síntoma
```bash
ssh: connect to host 192.168.64.7 port 2222: Connection refused

Diagnóstico
# En el servidor, verificar:
sudo systemctl status ssh
sudo netstat -tlnp | grep 2222
sudo ufw status | grep 2222

Soluciones
# 1. Reiniciar SSH
sudo systemctl restart ssh

# 2. Verificar puerto en configuración
sudo grep Port /etc/ssh/sshd_config

# 3. Permitir puerto en firewall
sudo ufw allow 2222/tcp
sudo ufw reload

# 4. Si no funciona, reiniciar sistema
sudo reboot

🐳 Contenedores no inician
Síntoma
docker ps # No muestra contenedores esperados
docker logs nombre-contenedor # Muestra errores

Diagnóstico
# Ver todos los contenedores (incluyendo detenidos)
docker ps -a

# Ver logs del contenedor
docker logs --tail 50 nombre-contenedor

# Ver logs de Docker
sudo journalctl -u docker -n 50

Soluciones
# 1. Reiniciar Docker
sudo systemctl restart docker

# 2. Recrear contenedor
docker stop nombre-contenedor
docker rm nombre-contenedor
# Ejecutar comando docker run original

# 3. Verificar puertos ocupados
sudo netstat -tlnp | grep :5432  # PostgreSQL
sudo netstat -tlnp | grep :6379  # Redis

🐢 Servidor lento
Síntoma
Respuesta lenta

Comandos tardan en ejecutarse

Diagnóstico
# Ver recursos
htop
free -h
df -h
docker stats --no-stream

# Ver procesos
ps aux --sort=-%cpu | head -10
ps aux --sort=-%mem | head -10

Soluciones
# 1. Limpiar Docker
docker system prune -f
docker image prune -a -f

# 2. Limpiar logs
sudo journalctl --vacuum-size=100M

# 3. Reiniciar servicios lentos
docker restart redis postgres node-exporter

# 4. Último recurso: reiniciar servidor
sudo reboot

🔥 Firewall bloquea servicios
Síntoma
Servicio corre pero no accesible desde fuera

curl localhost:puerto funciona pero curl IP:puerto no

Diagnóstico
# Ver reglas UFW
sudo ufw status verbose

# Verificar puerto local
sudo netstat -tlnp | grep :PUERTO

# Probar desde otra máquina
nc -zv IP-SERVIDOR PUERTO

Soluciones
# Permitir puerto específico
sudo ufw allow PUERTO/tcp

# Permitir desde IP específica
sudo ufw allow from 192.168.1.100 to any port PUERTO

# Recargar firewall
sudo ufw reload

💾 No hay espacio en disco
Síntoma
df -h # Muestra uso cercano al 100%

Diagnóstico
# Ver qué ocupa espacio
du -sh /* 2>/dev/null | sort -h | tail -10
du -sh /home/* 2>/dev/null | sort -h
du -sh /var/log/* 2>/dev/null | sort -h

# Ver imágenes Docker no usadas
docker image ls
docker system df

Soluciones
# 1. Limpiar Docker
docker system prune -a -f

# 2. Limpiar logs viejos
sudo journalctl --vacuum-size=200M
sudo rm -rf /var/log/*.gz /var/log/*.old

# 3. Limpiar caché de paquetes
sudo apt clean
sudo apt autoremove -y

# 4. Comprimir/eliminar backups viejos
find ~/backups -name "*.tar.gz" -mtime +30 -delete

🗄️ Base de datos no responde
PostgreSQL
# Verificar estado
docker exec postgres pg_isready -U postgres

# Ver logs
docker logs postgres --tail 50

# Conectar y diagnosticar
docker exec -it postgres psql -U postgres -c "SELECT now();"
docker exec -it postgres psql -U postgres -c "SELECT datname FROM pg_database;"

# Reiniciar si es necesario
docker restart postgres

Redis
# Verificar estado
docker exec redis redis-cli ping

# Ver estadísticas
docker exec redis redis-cli info stats | grep total

# Ver memoria usada
docker exec redis redis-cli info memory | grep used_memory_human

# Reiniciar
docker restart redis

🌐 Problemas de red
Diagnóstico rápido

# Ver IP
hostname -I
ip a

# Ver gateway
ip route | grep default

# Probar conectividad
ping -c 4 8.8.8.8
ping -c 4 google.com

# Ver DNS
cat /etc/resolv.conf
nslookup google.com

Soluciones
# Renovar IP (si DHCP)
sudo dhclient -v

# Reiniciar red
sudo netplan apply
sudo systemctl restart systemd-networkd

# Verificar configuración Netplan
sudo cat /etc/netplan/*.yaml

💔 Backups fallan
Síntoma
Scripts de backup no generan archivos

Backups incompletos

Diagnóstico
# Ejecutar manualmente y ver errores
bash -x ~/backup/backup-configs.sh
bash -x ~/backup/backup-docker.sh

# Verificar permisos
ls -la ~/backups/
df -h ~/backups/

Soluciones
# 1. Crear directorio si no existe
mkdir -p ~/backups

# 2. Verificar espacio
df -h ~

# 3. Verificar que los contenedores existen
docker ps | grep -E "postgres|redis"

# 4. Probar backup manualmente
docker exec postgres pg_dump -U postgres -d appdb > test.sql

📝 Comandos de diagnóstico rápido
# Script de diagnóstico general
echo "=== DIAGNÓSTICO RÁPIDO ==="
echo "Fecha: $(date)"
echo "Uptime: $(uptime -p)"
echo ""
echo "=== CONTENEDORES ==="
docker ps --format "table {{.Names}}\t{{.Status}}"
echo ""
echo "=== RECURSOS ==="
free -h | grep Mem
df -h / | awk 'NR==2 {print "Disco: " $5}'
echo ""
echo "=== SERVICIOS ==="
sudo systemctl is-active ssh >/dev/null && echo "✅ SSH OK" || echo "❌ SSH"
sudo systemctl is-active docker >/dev/null && echo "✅ Docker OK" || echo "❌ Docker"