# 🖥️ Configuración de Ubuntu Desktop

## 📋 Configuraciones Post-Instalación

### 1. Actualización del Sistema
```bash
# Actualizar lista de paquetes
sudo apt update

# Actualizar todos los paquetes instalados
sudo apt upgrade -y

# Actualizar también el kernel y paquetes del sistema
sudo apt dist-upgrade -y

# Limpiar paquetes innecesarios
sudo apt autoremove -y
sudo apt autoclean

# Instalar herramientas esenciales
sudo apt install -y \
  curl \
  wget \
  git \
  vim \
  htop \
  tree \
  net-tools \
  software-properties-common \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release

  # Ver interfaces de red
ip a

# Ver configuración actual
ip route show

# Probar conectividad
ping -c 4 8.8.8.8
ping -c 4 google.com

# Configuración de Pantalla (UTM)
Resolución recomendada: 1920x1080

Controlador gráfico: VirtIO-GPU

Ajustes en UTM:

Display → VirtIO-GPU

Resolución dinámica o fija según preferencia

# Ver configuración actual
localectl status

# Cambiar a teclado español
sudo localectl set-keymap es
sudo localectl set-x11-keymap es

# Verificar
localectl status

# Ver zona horaria actual
timedatectl

# Listar zonas disponibles
timedatectl list-timezones | grep -i "madrid\|mexico\|bogota"

# Establecer zona (ejemplo para México)
sudo timedatectl set-timezone America/Mexico_City

# Verificar
timedatectl

# Ver hostname actual
hostname

# Cambiar hostname (ejemplo)
sudo hostnamectl set-hostname desktop01

# Verificar
hostname

# Ver información del usuario
id
groups

# Agregar usuario a grupos adicionales (ejemplo)
sudo usermod -aG docker $USER
# Nota: Requiere reiniciar sesión

# Instalar Zsh
sudo apt install -y zsh

# Cambiar shell por defecto
chsh -s $(which zsh)

# Verificar
echo $SHELL

# Configurar usuario global
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"

# Configurar editor por defecto
git config --global core.editor "vim"

# Ver configuración
git config --list

# Limitar uso de swap (si tienes suficiente RAM)
sudo sysctl vm.swappiness=10

# Hacer permanente
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

# Ver espacio en disco
df -h

# Limpiar caché de paquetes
sudo apt clean
sudo apt autoremove --purge

# Ver logs del sistema
journalctl -xe

# Limitar tamaño de logs
sudo journalctl --vacuum-size=100M

echo "=== CONFIGURACIÓN COMPLETADA ==="
echo "Sistema: $(lsb_release -d | cut -f2)"
echo "Kernel: $(uname -r)"
echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
echo "Zona horaria: $(timedatectl | grep "Time zone" | awk '{print $3}')"
echo "Teclado: $(localectl status | grep "Layout" | awk '{print $3}')"

