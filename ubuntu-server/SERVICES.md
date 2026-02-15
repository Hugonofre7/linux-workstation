# 🚀 Servicios en Ubuntu Server (Producción)

## 📋 Servicios Instalados vía Docker

### 1. Redis - Caché y Sesiones
```bash
# Contenedor
docker run -d \
  --name=redis \
  --restart=unless-stopped \
  -v redis_data:/data \
  -p 6379:6379 \
  redis:alpine

# Comandos útiles
docker exec -it redis redis-cli ping        # Verificar conexión
docker exec -it redis redis-cli info stats  # Estadísticas
docker logs redis --tail 50                  # Ver últimos logs


### 2. PostgreSQL - Base de Datos SQL
# Contenedor
docker run -d \
  --name=redis \
  --restart=unless-stopped \
  -v redis_data:/data \
  -p 6379:6379 \
  redis:alpine

# Comandos útiles
docker exec -it redis redis-cli ping        # Verificar conexión
docker exec -it redis redis-cli info stats  # Estadísticas
docker logs redis --tail 50                  # Ver últimos logs

### 3. Node Exporter - Métricas del Sistema
# Contenedor
docker run -d \
  --name=node-exporter \
  --restart=unless-stopped \
  --net="host" \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  prom/node-exporter:latest \
  --path.rootfs=/host

# Ver métricas
curl http://localhost:9100/metrics | head -20

### 4. cAdvisor - Métricas de Contenedores (Opcional)
# Contenedor
docker run -d \
  --name=cadvisor \
  --restart=unless-stopped \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  gcr.io/cadvisor/cadvisor:latest

# Acceso web
echo "cAdvisor disponible en: http://$(hostname -I | awk '{print $1}'):8080"

## 🔧 Script de Health Check
#!/bin/bash
echo "=== ESTADO DEL SERVIDOR ==="
echo "🕐 $(date)"
echo "🔧 Uptime: $(uptime -p)"

echo -e "\n=== CONTENEDORES ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo -e "\n=== RECURSOS ==="
echo "Memoria: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo "Disco: $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')"

## 📊 Monitoreo de Servicios
# Ver todos los servicios
docker ps

# Ver logs en tiempo real
docker logs -f redis
docker logs -f postgres
docker logs -f node-exporter

# Ver uso de recursos
docker stats --no-stream
htop

# Probar Redis
docker exec redis redis-cli ping

# Probar PostgreSQL
docker exec postgres pg_isready -U postgres

# Probar Node Exporter
curl -s http://localhost:9100/metrics | grep -E "node_cpu|node_memory"

## 🔄 Reinicio y Mantenimiento
docker restart redis postgres node-exporter
# Detener y remover
docker stop redis postgres node-exporter
docker rm redis postgres node-exporter

# Volver a crear con imágenes actualizadas
# (ejecutar comandos de creación nuevamente)

# Backup PostgreSQL
docker exec postgres pg_dump -U postgres appdb > backup_$(date +%Y%m%d).sql

# Backup Redis
docker exec redis redis-cli SAVE
docker cp redis:/data/dump.rdb ./redis_backup.rdb

## ⚠️ Troubleshooting por Servicio
# Error de conexión
docker logs redis --tail 50

# Reiniciar si es necesario
docker restart redis

# Verificar logs de error
docker logs postgres --tail 50

# Conectar directamente
docker exec -it postgres psql -U postgres

# Verificar métricas
curl -f http://localhost:9100/metrics > /dev/null && echo "OK" || echo "FAIL"


## ✅ Estado Ideal
# Todos los servicios deben mostrar "Up"
docker ps --format "table {{.Names}}\t{{.Status}}"

# Resultado esperado:
# NAMES           STATUS
# redis           Up X hours
# postgres        Up X hours
# node-exporter   Up X hours