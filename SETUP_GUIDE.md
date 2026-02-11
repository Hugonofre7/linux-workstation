# 🛠️ Guía Paso a Paso — Instalación de Máquinas Virtuales Ubuntu

Esta guía documenta el proceso completo para crear y configurar
máquinas virtuales Ubuntu Desktop y Ubuntu Server en Mac M2 con UTM.

---

## 🧩 FASE 1 — Preparación del Host (macOS M2)

### 1. Instalar UTM
- Descargar desde: Mac App Store o https://mac.getutm.app
- Versión: UTM 4.4.9 o superior (soporte ARM64)

### 2. Descargar ISOs **ARM64**:
- **Ubuntu Desktop 24.04 LTS (ARM64)**
- **Ubuntu Server 24.04 LTS (ARM64)**

Fuente oficial: https://ubuntu.com/download/arm

### 3. Preparar SSD externo (500GB):
- Particionar: 200GB (Desktop) + 150GB (Server) + 150GB (Archivos)
- Formato: APFS para macOS, exFAT para compartir con Linux

---

## 🖥️ FASE 2 — Creación de Ubuntu Desktop

1. Crear nueva VM en UTM → **Virtualize** (no Emulate)
2. Asignar recursos para Mac M2:
   - RAM: **4 GB** (de 8GB disponibles)
   - CPU: **2 núcleos** (de 8 disponibles)
   - Disco: **200 GB** (QCOW2 dinámico)
   - Arquitectura: **ARM64**
3. Montar ISO de Ubuntu Desktop **ARM64**
4. Ejecutar instalación gráfica

📄 Detalles completos en: `ubuntu-desktop/INSTALLATION.md`

---

## 🧱 FASE 3 — Creación de Ubuntu Server

1. Crear nueva VM en **UTM** → **Virtualize**
2. Asignar recursos:
   - RAM: **3 GB**
   - CPU: **2 núcleos**
   - Disco: **150 GB** (QCOW2 dinámico)
   - Arquitectura: **ARM64**
   - Sin interfaz gráfica (solo terminal)
3. Montar ISO de Ubuntu Server **ARM64**
4. Ejecutar instalación mínima (solo SSH server)

📄 Detalles completos en: `ubuntu-server/INSTALLATION.md`

---

## 🌐 FASE 4 — Configuración de Red UTM

- Modo red: **Shared Network** (NAT) para desarrollo
- **Bridge** para producción (IP fija)
- Puerto SSH: **2222** (seguridad)

📄 Ver: `network/NETWORK_SETUP.md`

---

## 🔄 FASE 5 — Post-instalación

- Actualización del sistema: `sudo apt update && sudo apt upgrade`
- Configuración SSH segura (puerto 2222)
- Instalación Docker y contenedores esenciales
- Hardening básico (UFW, Fail2Ban)

---

**Próximo paso:** Documentar instalación específica de Ubuntu Server ARM64