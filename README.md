# 🖥️ Configuración de Entorno SRE/DevOps para Mac M2

**Fecha de creación:** Noviembre 2025  
**Sistema Host:** macOS Apple Silicon M2  
**Virtualizador:** UTM  
**Ubicación VMs:** SSD Externo 500GB  
**Arquitectura:** ARM64

## 📋 Visión General
Esta documentación detalla la configuración completa de dos máquinas virtuales Ubuntu optimizadas para ARM64:

1. **Ubuntu Desktop 24.04** — Entorno de desarrollo SRE/DevOps con GUI  
2. **Ubuntu Server 24.04** — Entorno de producción real (solo terminal)

## 🎯 Objetivo
Crear una estación de trabajo profesional para aprendizaje y práctica de:
- Site Reliability Engineering (SRE)
- DevOps prácticas y herramientas
- Administración de sistemas Linux
- Contenedores y orquestación

## 🛠️ Stack Tecnológico Implementado
- **Docker** + contenedores esenciales (Redis, PostgreSQL, Node Exporter)
- **SSH seguro** en puerto 2222
- **Monitoreo** con scripts automatizados
- **AWS CLI** + **Google Cloud SDK** (ARM64)
- **Terraform, Ansible, Kubernetes tools**

## 📁 Estructura del Proyecto
```text
vm-setup/
├── README.md                    # Este archivo
├── SETUP_GUIDE.md              # Guía paso a paso
├── ubuntu-desktop/             # Configuración Desktop
├── ubuntu-server/              # Configuración Server
├── network/                    # Configuración de red UTM
├── tools/                      # Herramientas DevOps
└── backup/                     # Scripts de respaldo
