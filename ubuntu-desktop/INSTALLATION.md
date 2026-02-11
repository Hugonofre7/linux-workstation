# 🚀 Instalación Ubuntu Server 24.04 ARM64 en UTM (Mac M2)

## 📋 Requisitos Previos
- Mac con chip Apple Silicon M2
- UTM instalado (https://mac.getutm.app)
- SSD externo de 500GB recomendado
- ISO Ubuntu Server 24.04 ARM64 descargada

## 🛠️ Configuración UTM

### Paso 1: Crear nueva VM
1. Abrir UTM
2. Clic en "Create a New Virtual Machine"
3. Seleccionar "Virtualize" (no Emulate)

### Paso 2: Configurar Hardware
- **Sistema:** Linux
- **Arquitectura:** ARM64 (aarch64)
- **Memoria:** 3 GB RAM (de 8GB disponibles)
- **CPU:** 2 núcleos
- **Almacenamiento:** 150 GB (QCOW2, dinámico)

### Paso 3: Instalación del Sistema
1. Bootear desde ISO de Ubuntu Server ARM64
2. Seleccionar idioma español
3. Elegir instalación mínima (solo SSH server)
4. Particionamiento automático
5. Usuario: `honofre7`
6. Hostname: `server01`

### Paso 4: Post-Instalación
```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar herramientas básicas
sudo apt install -y curl wget git vim htop
