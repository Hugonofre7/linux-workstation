# 🌐 Configuración de Red para Ubuntu Server en UTM

## 📋 Modos de Red en UTM

### NAT (Shared Network) - Recomendado para desarrollo
- Configuración automática
- IP dinámica asignada por UTM
- Acceso a internet garantizado

### Bridge - Para producción
- IP fija en la red local
- Acceso desde otros dispositivos
- Requiere configuración manual

---

## 🔧 Verificar configuración actual

```bash
# Ver interfaces de red
ip a
hostname -I

# Verificar conexión
ping -c 4 8.8.8.8
```

---

## 📝 Configuración de IP Estática (Bridge)

### 1. Identificar la interfaz de red
```bash
ip link show
# Normalmente: enp0s1, enp0s2, eth0
```

### 2. Editar configuración de Netplan
```bash
sudo nano /etc/netplan/01-netcfg.yaml
```

### 3. Configuración ejemplo (reemplazar con tus valores)
```yaml
network:
  version: 2
  ethernets:
    enp0s1:                    # Cambiar por tu interfaz
      dhcp4: no
      addresses:
        - 000.000.0.000/24    # IP fija deseada
      gateway4: 000.000.0.0    # IP del router
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

### 4. Aplicar configuración
```bash
sudo netplan apply
```

### 5. Verificar
```bash
ip a
ping -c 4 8.8.8.8
```