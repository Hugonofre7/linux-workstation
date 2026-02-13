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