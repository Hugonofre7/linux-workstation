#!/bin/bash
# backup-docker.sh - Backup de volúmenes Docker y bases de datos

BACKUP_DIR="/home/$(whoami)/backups"
DATE=$(date +%Y%m%d_%H%M%S)

echo "🐳 Iniciando backup de Docker..."
mkdir -p $BACKUP_DIR

# Backup PostgreSQL
if docker ps | grep -q postgres; then
    echo "📦 Backup PostgreSQL..."
    docker exec postgres pg_dump -U postgres -d appdb > $BACKUP_DIR/postgres-$DATE.sql 2>/dev/null
    gzip $BACKUP_DIR/postgres-$DATE.sql
    echo "✅ PostgreSQL backup completado"
fi

# Backup Redis
if docker ps | grep -q redis; then
    echo "📦 Backup Redis..."
    docker exec redis redis-cli SAVE > /dev/null
    docker cp redis:/data/dump.rdb $BACKUP_DIR/redis-$DATE.rdb 2>/dev/null
    gzip $BACKUP_DIR/redis-$DATE.rdb
    echo "✅ Redis backup completado"
fi

# Backup volúmenes Docker
echo "📦 Backup volúmenes Docker..."
docker run --rm -v postgres_data:/source -v $BACKUP_DIR:/backup alpine \
    tar -czf /backup/postgres-volume-$DATE.tar.gz -C /source ./ 2>/dev/null

docker run --rm -v redis_data:/source -v $BACKUP_DIR:/backup alpine \
    tar -czf /backup/redis-volume-$DATE.tar.gz -C /source ./ 2>/dev/null

echo "✅ Backups Docker completados en $BACKUP_DIR"
ls -la $BACKUP_DIR/*$DATE* 2>/dev/null || echo "⚠️ No se crearon backups"