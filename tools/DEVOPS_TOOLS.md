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

📦 Instalación por Sistema

🖥️ Ubuntu Desktop (Desarrollo)
Herramienta	Instalación
Docker	curl -fsSL https://get.docker.com | sh
Kubectl	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
Terraform	wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_arm64.zip
AWS CLI	curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

🚀 Ubuntu Server (Producción)
Herramienta	Instalación
Docker	curl -fsSL https://get.docker.com | sh
Redis	docker run -d --name=redis -p 6379:6379 redis:alpine
PostgreSQL	docker run -d --name=postgres -p 5432:5432 -e POSTGRES_PASSWORD=password postgres:alpine
Node Exporter	docker run -d --name=node-exporter -p 9100:9100 prom/node-exporter:latest

🔧 Scripts Automatizados
Ubuntu Desktop:
ubuntu-desktop/scripts/
├── setup-docker.sh
├── setup-k8s.sh
├── setup-terraform.sh
├── setup-aws.sh
└── setup-terminal.sh

Ubuntu Server:
ubuntu-server/scripts/
├── secure-ssh.sh
├── setup-docker.sh
└── health-check.sh

📊 Comandos Útiles para Monitoreo
# Ver contenedores activos
docker ps

# Ver logs en tiempo real
docker logs -f nombre-contenedor

# Monitoreo de recursos
htop
docker stats

# Health check completo
~/scripts/health-check.sh

✅ Verificación de Instalación
# Verificar versiones
docker --version
kubectl version --client
terraform version
aws --version
ansible --version

📚 Recursos de Aprendizaje
Docker Documentation

Kubernetes Official Docs

Terraform Learn

AWS CLI Docs

