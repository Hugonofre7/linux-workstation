# 🌐 Configuración de Red en UTM para Mac M2

## 📋 Modos de Red Disponibles

### 1. Compartir Red (NAT) - Por defecto
- **Uso:** Desarrollo, acceso a internet
- **IP dinámica:** Asignada por UTM
- **Ventaja:** Funciona inmediatamente, sin configuración

### 2. Red Puente (Bridge) - Para producción
- **Uso:** Servidor accesible desde la red local
- **IP fija:** Recomendada para servidor
- **Ventaja:** Acceso directo desde otros dispositivos

---

## 🖥️ Configuración en UTM

### Paso 1: Acceder a configuración de red
1. Seleccionar la VM
2. Clic en "Editar" (✏️)
3. Ir a "Dispositivos" → "Nuevo" → "Interfaz de Red"

### Paso 2: Elegir modo
- **NAT (Emulado):** `Shared Network` 
- **Bridge:** `Bridge` + seleccionar interfaz Wi-Fi/Ethernet

### Paso 3: Verificar dentro de la VM
```bash
# Ver IP asignada
ip a
hostname -I

# Verificar conexión
ping -c 4 8.8.8.8
ping -c 4 google.com

## 🎯 Modos de Red en UTM

### NAT (Shared Network) - Por defecto
**Características:**
- IP dinámica asignada por UTM
- Acceso a internet garantizado
- Las VMs están en red privada
- Recomendado para: Desarrollo, pruebas

**Configuración en UTM:**
1. Seleccionar VM → Editar
2. Dispositivos → Nuevo → Interfaz de Red
3. Modo: **Shared Network**

### Bridge (Red Puente)
**Características:**
- IP fija en la red local
- VM visible como dispositivo independiente
- Acceso directo desde otros equipos
- Recomendado para: Producción, servidores

**Configuración en UTM:**
1. Seleccionar VM → Editar
2. Dispositivos → Nuevo → Interfaz de Red
3. Modo: **Bridge** + seleccionar interfaz (Wi-Fi/Ethernet)

### Host Only (Solo Anfitrión)
**Características:**
- Comunicación solo entre host y VM
- Sin acceso a internet
- Recomendado para: Aislar entornos de prueba

---

## 🖥️ Configuración en macOS Host

### Verificar interfaces de red
```bash
# Listar interfaces
ifconfig
networksetup -listallnetworkservices

Compartir conexión (si es necesario)
# macOS System Preferences → Sharing
# Activar "Internet Sharing"

Ver IP del host
ipconfig getifaddr en0  # Wi-Fi
ipconfig getifaddr en1  # Ethernet

🐧 Configuración en Ubuntu
Ver configuración actual
# Ver interfaces
ip a
ip link show

# Ver rutas
ip route show
netstat -rn

# Ver DNS
cat /etc/resolv.conf

Configuración IP dinámica (DHCP) - Por defecto
# Verificar que DHCP está activo
cat /etc/netplan/*.yaml

Configuración de hostname
# Ver hostname actual
hostname

# Cambiar hostname
sudo hostnamectl set-hostname server01

# Verificar
hostname

Configuración de /etc/hosts
# Editar hosts
sudo nano /etc/hosts

# Agregar entradas manuales (ejemplo)
100.000.0.000 server01.local server01

🔍 Troubleshooting de Red
Problema: No hay conexión a internet
# Verificar interfaces
ip a

# Probar conectividad básica
ping -c 4 8.8.8.8

# Verificar DNS
nslookup google.com
dig google.com

# Verificar gateway
ip route | grep default

Problema: Bridge no funciona
# En macOS, verificar:
1. Modo Bridge seleccionado correctamente en UTM
2. Interfaz física activa (Wi-Fi/Ethernet)
3. Firewall no bloqueando

# En Ubuntu:
# Renovar IP (si DHCP)
sudo dhclient -v

Problema: Puerto no accesible
# Verificar puertos escuchando
sudo netstat -tlnp
sudo ss -tlnp

# Verificar firewall
sudo ufw status
sudo iptables -L

# Probar puerto específico
nc -zv localhost 2222
telnet localhost 2222

Herramientas de diagnóstico
# Instalar herramientas de red
sudo apt install -y net-tools traceroute mtr nmap tcpdump

# Traceroute
traceroute google.com

# MTR (combinación ping + traceroute)
mtr google.com

# Escaneo de puertos
nmap -p 1-1000 localhost

# Captura de tráfico
sudo tcpdump -i any port 22

📊 Monitoreo de Red
Estadísticas de red
# Ver conexiones activas
netstat -tan
ss -tan

# Ver estadísticas de interfaces
ip -s link

# Monitoreo en tiempo real
nethogs
iftop

Logs de red
# Logs del sistema
sudo journalctl -u networking
sudo journalctl -u NetworkManager

# Logs específicos
sudo tail -f /var/log/syslog | grep -i network