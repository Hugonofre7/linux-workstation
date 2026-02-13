# 🛠️ Herramientas DevOps Instaladas (ARM64)

## 📋 Stack Tecnológico Completo

| Herramienta | Versión | Arquitectura | Propósito |
|------------|---------|--------------|-----------|
| **Docker** | 24.0+ | ARM64 | Contenedores |
| **Kubectl** | 1.28+ | ARM64 | Orquestación Kubernetes |
| **Helm** | 3.13+ | ARM64 | Gestión paquetes K8s |
| **Terraform** | 1.7+ | ARM64 | Infraestructura como código |
| **Ansible** | 8.0+ | ARM64 | Automatización configuraciones |
| **AWS CLI** | 2.x | ARM64 | Gestión AWS |
| **Google Cloud SDK** | 450+ | ARM64 | Gestión GCP |
| **Stern** | 1.27+ | ARM64 | Logs multicontenedor |

---

## 🐳 **Contenedores Esenciales (Producción)**

```bash
# Redis - Caché y sesiones
docker run -d --name=redis -p 6379:6379 redis:alpine

# PostgreSQL - Base de datos SQL
docker run -d --name=postgres -p 5432:5432 -e POSTGRES_PASSWORD=password postgres:alpine

# Node Exporter - Métricas del sistema
docker run -d --name=node-exporter -p 9100:9100 prom/node-exporter:latest

# cAdvisor - Métricas de contenedores
docker run -d --name=cadvisor -p 8080:8080 gcr.io/cadvisor/cadvisor:latest