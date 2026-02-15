#!/bin/bash
# health-check.sh - Script de monitoreo para Ubuntu Server

echo "=== 🏥 HEALTH CHECK - UBUNTU SERVER ==="
echo "Fecha: $(date)"
echo "Uptime: $(uptime -p)"
echo ""

echo "=== CONTENEDORES ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" 2>/dev/null || echo "❌ Docker no está corriendo"

echo ""
echo "=== RECURSOS DEL SISTEMA ==="
echo "Memoria:"
free -h | grep "Mem"
echo ""
echo "Disco:"
df -h / | awk 'NR==2 {print "Uso: " $3 "/" $2 " (" $5 ")"}'
echo ""
echo "CPU Load: $(uptime | awk -F'load average:' '{print $2}')"

echo ""
echo "=== SERVICIOS CRÍTICOS ==="
systemctl is-active ssh >/dev/null && echo "✅ SSH activo" || echo "❌ SSH inactivo"
systemctl is-active docker >/dev/null && echo "✅ Docker activo" || echo "❌ Docker inactivo"
sudo ufw status | grep -q "Status: active" && echo "✅ Firewall activo" || echo "⚠️ Firewall no activo"

echo ""
echo "=== CONEXIONES SSH RECIENTES ==="
sudo grep "Accepted" /var/log/auth.log | tail -3 2>/dev/null || echo "No hay conexiones recientes"

echo ""
echo "=== ESTADO DE BACKUPS ==="
ls -la ~/backups/ 2>/dev/null | tail -3 || echo "No hay backups disponibles"