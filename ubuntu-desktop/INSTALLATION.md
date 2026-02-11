# 🖥️ Instalación Ubuntu Desktop 24.04 ARM64 en UTM (Mac M2)

## 📋 Requisitos Previos
- Mac Apple Silicon M2
- UTM 4.4.9 o superior
- SSD externo de 500GB recomendado
- ISO Ubuntu Desktop 24.04 ARM64

## 🛠️ Configuración UTM para Desktop

### Paso 1: Crear VM en UTM
1. Abrir UTM → "Create a New Virtual Machine"
2. Seleccionar **"Virtualize"** (no Emulate)
3. Sistema: **Linux**

### Paso 2: Configuración Hardware
- **Arquitectura:** ARM64 (aarch64)
- **Memoria:** 4 GB RAM (de 8GB disponibles)
- **CPU:** 2 núcleos
- **Almacenamiento:** 200 GB (QCOW2, dinámico)
- **Pantalla:** VirtIO-GPU (mejor rendimiento)
- **Resolución:** 1920x1080

### Paso 3: Instalación Gráfica
1. Bootear desde ISO Ubuntu Desktop ARM64
2. Seleccionar idioma español
3. Tipo de instalación: **Normal installation**
4. Opciones adicionales: 
   - [x] Install third-party software
   - [ ] Download updates while installing
5. Instalación en disco completo (200GB)
6. Usuario: `honofre7`
7. Hostname: `desktop01`

### Paso 4: Post-Instalación Básica
```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar herramientas esenciales
sudo apt install -y curl wget git vim htop