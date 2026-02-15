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
